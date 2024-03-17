import 'package:tresto_v002a/LOGIC/Models/DashBoard_RestoModels/dashboard_data.dart';

enum DashBoardStateApiEnum { success, failure, loading, nothing }

class DashBoardState {
  final DashBoardFullListData dashboardData;
  DashBoardStateApiEnum dashBoardStateApiEnum;
  String authToken;
  DashBoardState(
      {required this.dashboardData,
      required this.dashBoardStateApiEnum,
      this.authToken = '',});
//dashboard state used to interact with dashboard cubit
//think of it as a wrapper to the dashboard data model
  DashBoardState copyWith({
    DashBoardFullListData? dashboardData,
    DashBoardStateApiEnum? dashBoardStateApiEnum,
    String? token,
    String? authToken,
  }) {
    return DashBoardState(
        dashboardData: dashboardData ?? this.dashboardData,
        dashBoardStateApiEnum:
            dashBoardStateApiEnum ?? this.dashBoardStateApiEnum,
        authToken: authToken ?? this.authToken
        );
  }
}
