import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';
import 'package:tresto_v002a/LOGIC/Providers/Api/order_data_provider.dart';

class OrdersRepository {
  OrdersRepository();
  final OrderRestoListProvider orders = OrderRestoListProvider();

  Future<OrderRestoList> getOrderData() async {
    var ordersList = await orders.getOrdersDataFromApi();
    return ordersList; // await _dashBoard.getDashBoardFullListData();
  }
}
