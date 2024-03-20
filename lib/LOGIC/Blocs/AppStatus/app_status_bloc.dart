import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';
import 'package:tresto_v002a/LOGIC/Repos/app_status_repo.dart';

part 'app_status_event.dart';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  final AppStatusRepository statusRepo;
  AppStatusBloc(this.statusRepo) : super(AppStatusState.initial()) {
    on<UpdateLoginStatus>(updateLoginStatus);
  }

  void updateLoginStatus(UpdateLoginStatus event, Emitter<AppStatusState> emit) {
    emit(state.copyWith(loginStatus:event.status));
  }

  
}
