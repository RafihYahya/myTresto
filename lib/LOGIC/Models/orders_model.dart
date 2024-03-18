import 'package:flutter/material.dart';

enum OrderStatus { accepted, rejected, pending }

class OrderClientDetails {
  final String? phoneNumber;
  final String? address;
  final String? deliveryZone;

  OrderClientDetails({
    required this.phoneNumber,
    required this.address,
    required this.deliveryZone,
  });
}

//
class OrderDetails {
  final Image? productImage;
  final String? productTitle;
  final String? productCategoryName;
  final double? taxPrice;
  final double? priceDelivery;
  final OrderClientDetails? clientDetails;
  OrderDetails(
      {required this.productImage,
      required this.productTitle,
      required this.productCategoryName,
      required this.taxPrice,
      required this.priceDelivery,
      required this.clientDetails});
}

//

class OrderData {
  final int? orderId;
  final String? customerName;
  final String? price;
  final int? amount;
  final String? date;
  final OrderStatus? status;
  final OrderDetails? details;

  OrderData(
      {required this.orderId,
      required this.customerName,
      required this.price,
      required this.amount,
      required this.details,
      required this.date,
      required this.status});
}

//

///
class OrderListData {
  final List<OrderData> ordersList;
  final String? restoName;
  OrderListData({required this.ordersList, required this.restoName});
}

///
///
///
class OrderRestoList {
  final List<OrderListData> ordersRestoList;
  OrderRestoList({required this.ordersRestoList});
}
