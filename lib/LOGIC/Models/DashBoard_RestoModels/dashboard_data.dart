import 'package:tresto_v002a/LOGIC/Models/OrderModels/order_data.dart';
import 'package:tresto_v002a/LOGIC/Models/DashBoard_RestoModels/resto_info.dart';




class DashboardTileData {
  final int? number;
  final String title;

  DashboardTileData(
      {required this.number,
      required this.title});
}


////////////////////////////////////////////////////////////////////
///
///
///
class DashBoardListTileData {
  final List<DashboardTileData?> dashList;
  final RestoInfo? restoInfo;
  

  DashBoardListTileData({required this.restoInfo,required this.dashList});
}


/////////////////////////////////////////////////////////////////////////////////



class DashBoardFullListData {
  List<DashBoardListTileData?> dashBoardFull;
  OrderDataFullList orderslistFull;
  List<RestoInfo?> get restoList => dashBoardFull.map((e) => e?.restoInfo).toList();
  final String? extraInfo;

  DashBoardFullListData(
      {required this.dashBoardFull,
      this.extraInfo,
      required this.orderslistFull});

      
}