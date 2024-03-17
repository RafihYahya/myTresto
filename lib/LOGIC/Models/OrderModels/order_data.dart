
import 'package:tresto_v002a/LOGIC/Models/OrderModels/order_details_data.dart';

enum OrderStatus {
  pending,
  accepted,
  rejected,
  delivered
}

class OrderData {
  final int? orderId;
  final String? customerName;
  final String? date;
  final String? amount;
  final OrderStatus status;
  final OrderDetails? orderDetails;

  OrderData({
    required this.orderId,
    required this.customerName,
    required this.date,
    required this.amount,
    required this.status,
    required this.orderDetails
  });
}

/////////////////////
///
///
class OrderDataList {
  final List<OrderData?> ordersList;
    final String? extraInfo;

  OrderDataList({required this.ordersList,this.extraInfo});
}

///////////////////

class OrderDataFullList {
  final List<OrderDataList?> ordersFullList;
  final String? extraInfo;

  OrderDataFullList({required this.ordersFullList,  this.extraInfo});
}


