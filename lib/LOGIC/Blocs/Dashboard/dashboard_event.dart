part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DashboardInit extends DashboardEvent {}

final class DashboardAdd extends DashboardEvent {}

final class DashboardUpdate extends DashboardEvent {}

final class DashboardRemove extends DashboardEvent {}

final class DashboardStateChange extends DashboardEvent {
  final DashboardStateStatus status;
  DashboardStateChange({
    required this.status,
  });
}
