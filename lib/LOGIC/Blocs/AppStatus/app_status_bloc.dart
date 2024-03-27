import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';
import 'package:tresto_v002a/LOGIC/Repos/app_status_repo.dart';
import 'package:tresto_v002a/LOGIC/Repos/auth_repo.dart';

part 'app_status_event.dart';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  final AppStatusRepository statusRepo;
  final AuthRepository authRepo;
  AppStatusBloc(this.statusRepo, this.authRepo)
      : super(AppStatusState.initial()) {
    on<UpdateLoginStatus>(updateLoginStatus);
    on<BypassLogin>(checkIfTokenIsLocalSaved);
  }

  void updateLoginStatus(
      UpdateLoginStatus event, Emitter<AppStatusState> emit) {
    emit(state.copyWith(loginStatus: event.status));
  }

  Future<void> checkIfTokenIsLocalSaved(
      BypassLogin event, Emitter<AppStatusState> emit) async {
        print('first');
    print(await authRepo.checkTokenIfExist(event.key));
    var isTokenExist = await authRepo.checkTokenIfExist(event.key);
    print('second');
    print(isTokenExist);
    if (isTokenExist) {
      emit(state.copyWith(loginStatus: AppStatusLogin.loggedIn));
    }
  }
}
