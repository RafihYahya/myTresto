part of 'dashboard_bloc.dart';

enum DashboardStateStatus { error, initial,loading , ready}

final class DashboardState extends Equatable {
  final DashBoardRestoList dashBoardRestoList;
  final DashboardStateStatus status;
  final bool isAlreadyLoadedOnce;

  const DashboardState(
      {required this.dashBoardRestoList, required this.status,
      required this.isAlreadyLoadedOnce,
      });

  const DashboardState.initial({
    this.dashBoardRestoList = const DashBoardRestoList(dashBoardRestoList: []),
    this.status = DashboardStateStatus.initial,
    this.isAlreadyLoadedOnce = false,
  });

  DashboardState copyWith({
    DashBoardRestoList? dashBoardRestoList,
    DashboardStateStatus? status,
    bool? isAlreadyLoadedOnce
  }) {
    return DashboardState(
        dashBoardRestoList: dashBoardRestoList ?? this.dashBoardRestoList,
        status: status ?? this.status,
        isAlreadyLoadedOnce: isAlreadyLoadedOnce ?? this.isAlreadyLoadedOnce
        );
  }

  @override
  String toString(){
    return '''DashboardState { status: $status, dashBoardRestoList: ${dashBoardRestoList.dashBoardRestoList.length} }''';
  }

  @override 
    List<Object> get props => [status, dashBoardRestoList.dashBoardRestoList];

}
