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
    on<BypassLogin>(bypassLogin);
  }

  void updateLoginStatus(
      UpdateLoginStatus event, Emitter<AppStatusState> emit) async {
    if(event.status == AppStatusLogin.loggedOut){
      print('praise le miaw');
      await authRepo.deleteTokenValue();
    }
    emit(state.copyWith(loginStatus: event.status));
  }

  Future<void> bypassLogin(
      BypassLogin event, Emitter<AppStatusState> emit) async {
    String? temp = await authRepo.readTokenValue();
    if (temp != null) {
      emit(state.copyWith(loginStatus: AppStatusLogin.loggedIn));
      print(temp);
    }
    if(temp ==null ){
      print('nothing');
    }
    
  }
}
