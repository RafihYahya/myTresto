import 'package:flutter/material.dart';

class OrderDetails {
  final int id;
  final String productTitle;
  final String productCategoryName;
  final String dateProduct;
  final int productQuantity;
  final Image imageProduct;
  final double price;
  double get productPriceSum {
    return price*productQuantity + priceDelivery;
  }
  final double priceDelivery;
  final String clientName;
  final String clientTelephone;
  final String clientAdress;
  final String zone;
  final String status;

  OrderDetails({
    required this.id,
    required this.dateProduct,
    required this.productCategoryName,
    required this.productTitle,
    required this.imageProduct,
    required this.productQuantity,
    required this.price,
    required this.priceDelivery,
    required this.clientName,
    required this.clientTelephone,
    required this.clientAdress,
    required this.zone,
    required this.status
  });

}