import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';
import 'package:tresto_v002a/LOGIC/Repositories/dashboard_repo.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardRepository dashBoard;
  DashboardBloc({required this.dashBoard})
      : super(const DashboardState.initial()) {
    on<DashboardInit>((event, emit) {
      print('miaw');
    });
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
