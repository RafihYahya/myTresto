import 'package:bloc/bloc.dart';
import 'package:tresto_v002a/LOGIC/Repos/auth_repo.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository authRepo;
  AuthBlocBloc(this.authRepo) : super(AuthBlocState.initial()) {
    on<TokenRequest>(updateToken);
  }

  Future<void> updateToken(
      TokenRequest event, Emitter<AuthBlocState> emit) async {
    emit(state.copyWith(status: AuthState.loading));
    try {
      var token = await getToken('test2@gmail.com', 'test2@gmail.com');
      emit(state.copyWith(token: token, status: AuthState.done));
    } catch (e) {
      emit(state.copyWith(status: AuthState.failure));
    }
  }

  Future<String> getToken(String email, String password) async {
    return await authRepo.getTokenData(email, password);
  }
}