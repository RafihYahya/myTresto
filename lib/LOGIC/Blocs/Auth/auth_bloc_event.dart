part of 'auth_bloc_bloc.dart';

sealed class AuthBlocEvent {
  const AuthBlocEvent();
}

final class TokenRequest extends AuthBlocEvent {
  final String email;
  final String password;
  TokenRequest({required this.email, required this.password});
}

final class EmptyToken extends AuthBlocEvent {}


