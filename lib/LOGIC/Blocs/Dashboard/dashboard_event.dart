part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DashboardInit extends DashboardEvent {
  DashboardInit();
}

final class DashboardAdd extends DashboardEvent {
  DashboardAdd();
}

final class DashboardUpdate extends DashboardEvent {
  DashboardUpdate();
}

final class DashboardRemove extends DashboardEvent {
  DashboardRemove();
}

final class DashboardNewResto extends DashboardEvent {
  DashboardNewResto();
}
