import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';
import 'package:tresto_v002a/LOGIC/Repos/orders_repo.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepository orders;
  OrdersBloc(this.orders) : super(OrdersInitial()) {
    on<OrdersEvent>((event, emit) {});
    on<GetOrders>(ordersRetrieveData);
  }

  Future<void> ordersRetrieveData(
      GetOrders event, Emitter<OrdersState> emit) async {
    try {
      emit(OrdersLoading());
      var ordersList = await orders.getOrderData();
      emit(OrdersReady(ordersRestoList: ordersList));
    } catch (e) {
      emit(OrdersError());
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
