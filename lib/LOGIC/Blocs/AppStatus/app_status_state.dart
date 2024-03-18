part of 'app_status_bloc.dart';

enum AppStatusNetwork { idle, working, failure }

enum AppStatusApi { idle, working, failure }

enum AppStatusLocal { idle, working, failure }

enum AppStatusLogin { loggedIn, loggedOut }

@immutable
sealed class AppStatusState {}

final class AppStatusInitial extends AppStatusState {
  final AppStatusApi apiStatus = AppStatusApi.idle;
  final AppStatusNetwork networkStatus = AppStatusNetwork.idle;
  final AppStatusLocal localStatus = AppStatusLocal.idle;
  final AppStatusLogin loginStatus = AppStatusLogin.loggedOut;

  AppStatusInitial();
}

final class AppStatusWorking extends AppStatusState {
  final AppStatusApi apiStatus = AppStatusApi.working;
  final AppStatusNetwork networkStatus = AppStatusNetwork.working;
  final AppStatusLocal localStatus = AppStatusLocal.working;
  final AppStatusLogin loginStatus;

  AppStatusWorking({required this.loginStatus});
}

final class AppStatusDefault extends AppStatusState {
  final AppStatusApi apiStatus;
  final AppStatusNetwork networkStatus;
  final AppStatusLocal localStatus;
  final AppStatusLogin loginStatus;

  AppStatusDefault(
      {required this.apiStatus,
      required this.localStatus,
      required this.networkStatus,
      required this.loginStatus});
}

final class ApiStatusError extends AppStatusState {
  ApiStatusError();
}
