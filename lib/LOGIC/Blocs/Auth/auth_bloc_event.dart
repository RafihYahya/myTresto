part of 'auth_bloc_bloc.dart';

sealed class AuthBlocEvent{
  const AuthBlocEvent();
}


final class TokenRequest extends AuthBlocEvent{}


