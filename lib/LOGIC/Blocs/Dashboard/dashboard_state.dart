part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardComplete extends DashboardState {
  final DashBoardRestoList dashBoardRestoList;
  DashboardComplete(this.dashBoardRestoList);
}
