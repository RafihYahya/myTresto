part of 'auth_bloc_bloc.dart';

enum AuthState { init, loading, done, failure }

final class AuthBlocState {
  final AuthState status;
  final String? token;
  const AuthBlocState({required this.status, this.token});

  AuthBlocState copyWith({AuthState? status, String? token}) {
    return AuthBlocState(
        status: status ?? this.status, token: token ?? this.token);
  }

   AuthBlocState.initial({this.status = AuthState.init, this.token});
}
