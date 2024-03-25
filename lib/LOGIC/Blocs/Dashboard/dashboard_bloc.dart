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
    on<DashboardUpdate>(dashboardRetrieveData);
    on<DashboardReset>(dashboardResetState);
  }

  void dashboardResetState(DashboardReset event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(
        isAlreadyLoadedOnce: false)
        );
  }

  Future<void> dashboardRetrieveData(
      DashboardUpdate event, Emitter<DashboardState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
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
