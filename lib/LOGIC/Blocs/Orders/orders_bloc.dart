import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';
import 'package:tresto_v002a/LOGIC/Repos/orders_repo.dart';
import 'package:tresto_v002a/mock_data_testing.dart';
import 'package:tresto_v002a/notif_init.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepository orders;
  OrdersBloc(this.orders) : super(OrdersInitial()) {
    on<GetOrders>(ordersRetrieveData);
    on<NewOrder>(streamCheckAnyNewOrdersNotifier);
    on<TurnOffStream>(turnOffStream);
  }

  void turnOffStream(TurnOffStream event, Emitter<OrdersState> emit) {
    final state = this.state;
    if (state is OrdersReady) {
      emit(state.copyWith(isStreamActive: false));
    }
  }

  Future<void> ordersRetrieveData(
      GetOrders event, Emitter<OrdersState> emit) async {
    try {
      var ordersList = await orders.getOrderData();
      await Future.delayed(const Duration(seconds: 5));
      emit(OrdersReady(
          ordersRestoList: ordersFull,
          isAlreadyLoadedOnce: true,
          isStreamActive: true));
    } catch (e) {
      emit(OrdersError());
    }
  }

  void streamCheckAnyNewOrdersNotifier(
      NewOrder event, Emitter<OrdersState> emit) async {
    while (true) {
      final state = this.state;
      String? token = await orders.authProvider.readFromSecureStorage();
      if (token == null) {
        break;
      }
      if (state is OrdersReady) {
        if (state.isStreamActive == false) {
          emit(OrdersInitial());
          break;
        }
      }

      var randomInt = Random().nextInt(100);
      try {
        var isNewOrderAvailable = await orders.checkAnyNewOrdersAreAvailable();
        //jsson data with bool and new orders
        if (isNewOrderAvailable) {
          final localAndroidNotifDetails = NotificationDetails(
            android: AndroidNotificationDetails(
                randomInt.toString(), 'channelName',
                color: AppColor.trestoRed,
                /* styleInformation: BigTextStyleInformation(
                    htmlFormatBigText: true,
                    htmlFormatContentTitle: true,
                    htmlFormatSummaryText: true,
                    'Owner: John Doe <br /> Price: 450Dh <br /> Amount: 24',
                    summaryText: 'New Order Have Arrived',
                    contentTitle: 'Order N: ${randomInt * 10}'), */
                styleInformation: const DefaultStyleInformation(false, false),
                importance: Importance.max,
                priority: Priority.max),
          );
          LocalNotifications.displayNotifs2(randomInt, 'Order N: 83338',
              'Owner: Rafih Yahya', localAndroidNotifDetails);
          if (state is OrdersReady) {
            logger.i('Here to Add New Data');
          }
        }
      } catch (e) {
        emit(OrdersError());
        break;
      }
      await Future.delayed(const Duration(minutes: 1));
    }
  }

  List<String> restoListCollector() {
    var restoList = <String>[];
    final state = this.state;
    if (state is OrdersReady) {
      var index = 0;
      for (var e in state.ordersRestoList.ordersRestoList) {
        restoList.add((e.restoName ?? 'No Name') + index.toString());
      }
      return restoList;
    } else {
      return restoList;
    }
  }
}
