import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';
import 'package:tresto_v002a/LOGIC/Repos/dashboard_repo.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardRepository dashBoard;
  DashboardBloc({required this.dashBoard})
      : super(const DashboardState.initial()) {
    on<DashboardStateChange>(changeDashStatus);
    on<DashboardGet>(dashboardRetrieveData);
    on<DashboardReset>(dashboardResetState);
    on<DashboardUpdate>(dashboardUpdate);
  }

  void dashboardResetState(
      DashboardReset event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.initial());
  }

  void dashboardUpdate(
      DashboardUpdate event, Emitter<DashboardState> emit) async {
    while (true) {
      try {
        String? token = await dashBoard.authProvider.readFromSecureStorage();
        if (token == null) {
          break;
        }
        var dashboardData = await dashBoard.getDashboardData();
        emit(state.copyWith(
          dashBoardRestoList: dashboardData,
        ));
      } catch (e) {
        emit(state.copyWith(status: DashboardStateStatus.error));
        break;
      }
      await Future.delayed(const Duration(seconds: 15));
    }
  }

  Future<void> dashboardRetrieveData(
      DashboardGet event, Emitter<DashboardState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var dashboardData = await dashBoard.getDashboardData();
      emit(state.copyWith(
          status: DashboardStateStatus.ready,
          dashBoardRestoList: dashboardData,
          isAlreadyLoadedOnce: true));
    } catch (e) {
      emit(state.copyWith(status: DashboardStateStatus.error));
    }
  }

  Future<void> changeDashStatus(
      DashboardStateChange event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: event.status));
  }

  List<String> restoListCollector() {
    var index = 0;
    var restoList = <String>[];
    for (var e in state.dashBoardRestoList.dashBoardRestoList) {
      restoList.add(e.restoName + index.toString());
    }
    return restoList;
  }
}
