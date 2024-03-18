

const tileTitles = <String>['Total Vues', 'Total Orders', 'Total Profit', 'Total Sales'];



class DashboardTileData {
  final int? number;
  final String title;
  DashboardTileData({required this.number, required this.title});
}

//

class DashBoardChartData {
  DashBoardChartData();
}

//

class DashBoardListData {
  final List<DashboardTileData> dashBoardList;
  final DashBoardChartData dashBoardChartData;
  final String restoName;
  DashBoardListData(
      {required this.dashBoardList,
      required this.dashBoardChartData,
      required this.restoName});
}

//

class DashBoardRestoList {
  final List<DashBoardListData> dashBoardRestoList;
  DashBoardRestoList({required this.dashBoardRestoList});
}
