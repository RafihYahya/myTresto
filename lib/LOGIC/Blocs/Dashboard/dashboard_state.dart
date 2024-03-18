part of 'dashboard_bloc.dart';

final class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardSuccess extends DashboardState {
  final DashBoardRestoList dashBoardRestoList;
  DashboardSuccess(this.dashBoardRestoList);

  DashboardSuccess copyWith({
    DashBoardRestoList? dashBoardRestoList,
  }) {
    return DashboardSuccess(dashBoardRestoList ?? this.dashBoardRestoList);
  }
}

final class DashboardError extends DashboardState {
  DashboardError();
}
