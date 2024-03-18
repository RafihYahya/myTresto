part of 'app_status_bloc.dart';

enum AppStatusNetwork { idle, working, failure }

enum AppStatusApi { idle, working, failure }

enum AppStatusLocal { idle, working, failure }

enum AppStatusLogin {loggedIn, loggedOut}

@immutable
sealed class AppStatusState {}

final class AppStatusInitial extends AppStatusState {
  final AppStatusApi apiStatus;
  final AppStatusNetwork networkStatus;
  final AppStatusLocal localStatus;
  final AppStatusLogin loginStatus;

  AppStatusInitial(
      {this.apiStatus = AppStatusApi.idle,
      this.localStatus = AppStatusLocal.idle,
      this.networkStatus = AppStatusNetwork.idle,
      this.loginStatus = AppStatusLogin.loggedOut
      });
}

final class AppStatusWorking extends AppStatusState {
  final AppStatusApi apiStatus;
  final AppStatusNetwork networkStatus;
  final AppStatusLocal localStatus;
    final AppStatusLogin loginStatus;


  AppStatusWorking(
      {this.apiStatus = AppStatusApi.working,
      this.localStatus = AppStatusLocal.working,
      this.networkStatus = AppStatusNetwork.working,
      required this.loginStatus
      });
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
      required this.loginStatus
      });
}

class ApiStatusError extends AppStatusState {
  ApiStatusError();
}
