import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';
import 'package:tresto_v002a/LOGIC/Repos/app_status_repo.dart';

part 'app_status_event.dart';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  final AppStatusRepository statusRepo;
  AppStatusBloc(this.statusRepo) : super(AppStatusState.initial()) {
    on<CheckApiStatus>(updateLoginStatus);
    on<GetToken>(updateToken);
  }

  void updateLoginStatus(CheckApiStatus event, Emitter<AppStatusState> emit) {
    emit(state.copyWith(loginStatus: AppStatusLogin.loggedIn));
  }

  Future<String> getToken(String email, String password) async {
    return await statusRepo.getTokenData(email, password);
  }

  Future<void> updateToken(GetToken event, Emitter<AppStatusState> emit) async {
    try {
      var token = await getToken('test2@gmail.com', 'test2@gmail.com');
      emit(state.copyWith(authToken: token));
    } catch (e) {
      emit(state.copyWith(apiStatus: AppStatusApi.failure));
    }
  }
}
