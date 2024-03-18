import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';
import 'package:tresto_v002a/LOGIC/Repositories/dashboard_repo.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardRepository dashBoard;
  DashboardBloc({required this.dashBoard}) : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
    });
  }
}
