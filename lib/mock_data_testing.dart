import 'package:flutter/material.dart';
import 'package:tresto_v002a/LOGIC/Models/DashBoard_RestoModels/dashboard_data.dart';
import 'package:tresto_v002a/LOGIC/Models/OrderModels/order_data.dart';
import 'package:tresto_v002a/LOGIC/Models/OrderModels/order_details_data.dart';
import 'package:tresto_v002a/LOGIC/Models/DashBoard_RestoModels/resto_info.dart';
import 'package:tresto_v002a/Globals/constants.dart';

//mock data for testing , will be obsolete once api integration begin

List<String> restoList = ['test2','test3miaw', 'test4miaw', 'Testmiaw4'];

DashBoardFullListData dashboardfull2 = DashBoardFullListData(
    orderslistFull:
        OrderDataFullList(ordersFullList: [], extraInfo: 'extraInfo'),
    dashBoardFull: []);

final DashBoardFullListData dashboardfull = DashBoardFullListData(
    orderslistFull: OrderDataFullList(ordersFullList: [
      orderDataList,
      orderDataList2,
      orderDataList3,
    ], extraInfo: 'extraInfo'),
    dashBoardFull: [
      dashBoardListTileData,
      dashBoardListTileData2,
      dashBoardListTileData3
    ]);
final DashBoardFullListData dashboardfull3 = DashBoardFullListData(
    orderslistFull: OrderDataFullList(ordersFullList: [
      orderDataList3,
      orderDataList,
      orderDataList2,
    ], extraInfo: 'extraInfo'),
    dashBoardFull: [
      dashBoardListTileData2,
      dashBoardListTileData,
      dashBoardListTileData3
    ]);

final OrderDetails details = OrderDetails(
    id: 454,
    dateProduct: '2002',
    productCategoryName: 'Test',
    productTitle: 'Niaw',
    imageProduct: Image.asset(Images.burger),
    productQuantity: 10,
    price: 10,
    priceDelivery: 20,
    clientName: 'Miaw',
    clientTelephone: '066335484984',
    clientAdress: 'Morroco ',
    zone: 'zone',
    status: 'Waiting');
    

final OrderDataList orderDataList = OrderDataList(ordersList: [
  OrderData(
      orderId: 12345,
      customerName: 'Yahya',
      amount: '\$ 6.5',
      date: '2001',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 12346,
      customerName: 'Yahya2',
      amount: '\$ 6.5',
      date: '2002',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 12347,
      customerName: 'Yahya3',
      amount: '\$ 6.5',
      date: '2003',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 12348,
      customerName: 'Yahya4',
      amount: '\$ 6.5',
      date: '2004',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 12349,
      customerName: 'Yahya5',
      amount: '\$ 6.5',
      date: '2005',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 12350,
      customerName: 'Yahya6',
      amount: '\$ 6.5',
      date: '2006',
      status: OrderStatus.pending,
      orderDetails: details 
      ),
]);
final OrderDataList orderDataList2 = OrderDataList(ordersList: [
  OrderData(
      orderId: 22345,
      customerName: 'Ishin',
      amount: '\$10',
      date: '2017',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 22346,
      customerName: 'Ishin2',
      amount: '\$10',
      date: '2017',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 22347,
      customerName: 'Ishin3',
      amount: '\$10',
      date: '2017',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 22348,
      customerName: 'Ishin4',
      amount: '\$10',
      date: '2017',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 22349,
      customerName: 'Ishin5',
      amount: '\$10',
      date: '2017',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 22350,
      customerName: 'Ishin6',
      amount: '\$10',
      date: '2017',
      status: OrderStatus.pending,
      orderDetails: details 
      ),
]);
final OrderDataList orderDataList3 = OrderDataList(ordersList: [
  OrderData(
      orderId: 32345,
      customerName: 'Wolf',
      amount: '\$ 14',
      date: '2012',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 32346,
      customerName: 'Wolf2',
      amount: '\$ 14',
      date: '2012',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 32347,
      customerName: 'Wolf3',
      amount: '\$ 14',
      date: '2012',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 32348,
      customerName: 'Wolf4',
      amount: '\$ 14',
      date: '2012',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 32349,
      customerName: 'Wolf5',
      amount: '\$ 14',
      date: '2012',
      status: OrderStatus.accepted,
      orderDetails: details 
      ),
  OrderData(
      orderId: 32350,
      customerName: 'Wolf6',
      amount: '\$ 14',
      date: '2012',
      status: OrderStatus.pending,
      orderDetails: details 
      ),
]);

final DashBoardListTileData dashBoardListTileData =
    DashBoardListTileData(dashList: [
  DashboardTileData(
    number: 120,
    title: 'Total Orders',
  ),
  DashboardTileData(
    number: 180,
    title: 'Total Views',
  ),
  DashboardTileData(
    number: 240,
    title: 'Total Clients',
  ),
  DashboardTileData(
    number: 80,
    title: 'Total Revenue',
  ),
], restoInfo: RestoInfo(restoName: restoList[0], ownerName: 'ownerName', cityLocation: 'cityLocation', description: 'description'));
final DashBoardListTileData dashBoardListTileData2 =
    DashBoardListTileData(dashList: [
  DashboardTileData(
    number: 170,
    title: 'Total Orders',
  ),
  DashboardTileData(
    number: 120,
    title: 'Total Views',
  ),
  DashboardTileData(
    number: 210,
    title: 'Total Clients',
  ),
  DashboardTileData(
    number: 90,
    title: 'Total Revenue',
  ),
], restoInfo: RestoInfo(restoName: restoList[1], ownerName: 'ownerName', cityLocation: 'cityLocation', description: 'description'));
final DashBoardListTileData dashBoardListTileData3 =
    DashBoardListTileData(dashList: [
  DashboardTileData(
    number: 200,
    title: DashBoardTitles.totalOrders,
  ),
  DashboardTileData(
    number: 30,
    title: DashBoardTitles.totalViews,
  ),
  DashboardTileData(
    number: 280,
    title: DashBoardTitles.totalClient,
  ),
  DashboardTileData(
    number: 120,
    title: DashBoardTitles.totalRevenue,
  ),
], restoInfo: RestoInfo(restoName: restoList[2], ownerName: 'ownerName', cityLocation: 'cityLocation', description: 'description'));
final DashBoardListTileData dashBoardListTileData4 =
    DashBoardListTileData(dashList: [
  DashboardTileData(
    number: 2200,
    title: DashBoardTitles.totalOrders,
  ),
  DashboardTileData(
    number: 320,
    title: DashBoardTitles.totalViews,
  ),
  DashboardTileData(
    number: 2280,
    title: DashBoardTitles.totalClient,
  ),
  DashboardTileData(
    number: 1220,
    title: DashBoardTitles.totalRevenue,
  ),
], restoInfo: RestoInfo(restoName: restoList[3], ownerName: 'ownerName4', cityLocation: 'cityLocation', description: 'description'));


