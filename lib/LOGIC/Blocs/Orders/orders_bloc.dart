import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';
import 'package:tresto_v002a/LOGIC/Repos/orders_repo.dart';
import 'package:tresto_v002a/Debug/mock_data_testing.dart';
import 'package:tresto_v002a/notif_init.dart';
import 'package:http/http.dart' as http;

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
      await Future.delayed(const Duration(seconds: 2));
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
          final http.Response response = await http.get(Uri.parse(
              'https://lh5.googleusercontent.com/p/AF1QipPtNBIXNFKRihvNWiG0zBqN2efVvkLrBkBJfYb_=w160-h160-k-no'));

          final localAndroidNotifDetails = NotificationDetails(
            android: AndroidNotificationDetails(
                ledColor: AppColor.trestoRed,
                ledOnMs: 1,
                ledOffMs: 1,
                icon: '@mipmap/launcher_icon',
                largeIcon: ByteArrayAndroidBitmap.fromBase64String(
                    base64Encode(response.bodyBytes)),
                randomInt.toString(),
                'channelName',
                color: event.color,
                colorized: true,
                /* styleInformation: BigTextStyleInformation(
                    htmlFormatBigText: true,
                    htmlFormatContentTitle: true,
                    htmlFormatSummaryText: true,
                    'Owner: John Doe <br /> Price: 450Dh <br /> Amount: 24',
                    summaryText: 'New Order Have Arrived',
                    contentTitle: 'Order N: ${randomInt * 10}'), */
                styleInformation: const DefaultStyleInformation(true, true),
                importance: Importance.max,
                priority: Priority.max),
          );
          LocalNotifications.displayNotifs2(
              randomInt,
              'Restaurant: TrestoA',
              'Order N:292930 <br ><br /> Client: Rafih Yahya',
              localAndroidNotifDetails);
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
