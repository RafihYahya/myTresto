part of 'dashboard_bloc.dart';

enum DashboardStateStatus { error, initial, ready,loading }

final class DashboardState extends Equatable {
  final DashBoardRestoList dashBoardRestoList;
  final DashboardStateStatus status;

  const DashboardState(
      {required this.dashBoardRestoList, required this.status});

  const DashboardState.initial({
    this.dashBoardRestoList = const DashBoardRestoList(dashBoardRestoList: []),
    this.status = DashboardStateStatus.initial
  });

  DashboardState copyWith({
    DashBoardRestoList? dashBoardRestoList,
    DashboardStateStatus? status,
  }) {
    return DashboardState(
        dashBoardRestoList: dashBoardRestoList ?? this.dashBoardRestoList,
        status: status ?? this.status);
  }

  @override
  String toString(){
    return '''DashboardState { status: $status, dashBoardRestoList: ${dashBoardRestoList.dashBoardRestoList.length} }''';
  }

  @override 
    List<Object> get props => [status, dashBoardRestoList.dashBoardRestoList];

}
