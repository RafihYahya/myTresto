

const tileTitles = <String>['Total Vues', 'Total Orders', 'Total Profit', 'Total Sales'];



class DashboardTileData {
  final int? number;
  final String title;
  const DashboardTileData({required this.number, required this.title});
}

//

class DashBoardChartData {
  const DashBoardChartData();
}

//

class DashBoardListData {
  final List<DashboardTileData> dashBoardList;
  final DashBoardChartData dashBoardChartData;
  final String restoName;
  const DashBoardListData(
      {required this.dashBoardList,
      required this.dashBoardChartData,
      required this.restoName});
}

//

class DashBoardRestoList {
  final List<DashBoardListData> dashBoardRestoList;
  const DashBoardRestoList({required this.dashBoardRestoList});
}
