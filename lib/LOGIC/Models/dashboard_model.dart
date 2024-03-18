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
  DashBoardListData(
      {required this.dashBoardList, required this.dashBoardChartData});
}

//

class DashBoardRestoList {
  final List<DashboardTileData> dashBoardRestoList;
  DashBoardRestoList({required this.dashBoardRestoList});
}
