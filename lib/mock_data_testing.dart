import 'dart:math';

import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';
import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';

const restoNum = 3;
const tilesNum = 4;
const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
var restoName = generateString(8);

String generateString(int length) {
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
}

DashBoardRestoList dashboardFull = DashBoardRestoList(
    dashBoardRestoList: List.filled(
        restoNum,
        DashBoardListData(
            dashBoardList: List.filled(
                tilesNum,
                DashboardTileData(
                    number: Random().nextInt(1500),
                    title: tileTitles[Random().nextInt(tileTitles.length)])),
            dashBoardChartData: DashBoardChartData(),
            restoName: restoName)));

OrderRestoList ordersFull = OrderRestoList(
    ordersRestoList: List.filled(
        restoNum,
        OrderListData(
            ordersList: List.filled(
                Random().nextInt(20),
                OrderData(
                    orderId: 1000,
                    customerName: generateString(12),
                    price: Random().nextInt(1000).toString(),
                    amount: Random().nextInt(10),
                    details: OrderDetails(
                        productImage: null,
                        productTitle: generateString(10),
                        productCategoryName: generateString(14),
                        taxPrice: Random().nextDouble(),
                        priceDelivery: Random().nextDouble(),
                        clientDetails: OrderClientDetails(
                            phoneNumber:
                                (Random().nextInt(900000) + 100000).toString(),
                            address: generateString(10),
                            deliveryZone: generateString(10))),
                    date: generateString(12),
                    status: OrderStatus.accepted)),
            restoName: restoName)));
