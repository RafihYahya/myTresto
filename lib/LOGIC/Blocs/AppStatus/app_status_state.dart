enum AppStatusNetwork { working, failure }

enum AppStatusApi { working, failure }

enum AppStatusLocalStorage { working, failure }

enum AppStatusLogin { loggedIn, loggedOut }

enum AppStatusDataError { none, minor, major }

final class AppStatusState {
  final AppStatusApi apiStatus;
  final AppStatusLocalStorage localStorageStatus;
  final AppStatusNetwork networkStatus;
  final AppStatusLogin loginStatus;
  final AppStatusDataError dataError;
  final String authToken;

  AppStatusState({
    required this.apiStatus,
    required this.localStorageStatus,
    required this.networkStatus,
    required this.loginStatus,
    required this.dataError,
    required this.authToken,
  });

  AppStatusState copyWith({
    AppStatusApi? apiStatus,
    AppStatusLocalStorage? localStorageStatus,
    AppStatusNetwork? networkStatus,
    AppStatusDataError? dataError,
    AppStatusLogin? loginStatus,
    String? authToken,
  }) {
    return AppStatusState(
        apiStatus: apiStatus ?? this.apiStatus,
        localStorageStatus: localStorageStatus ?? this.localStorageStatus,
        networkStatus: networkStatus ?? this.networkStatus,
        loginStatus: loginStatus ?? this.loginStatus,
        dataError: dataError ?? this.dataError,
        authToken: authToken ?? this.authToken);
  }

  AppStatusState.initial(
      {this.apiStatus = AppStatusApi.working,
      this.localStorageStatus = AppStatusLocalStorage.working,
      this.networkStatus = AppStatusNetwork.working,
      this.loginStatus = AppStatusLogin.loggedOut,
      this.authToken = '',
      this.dataError = AppStatusDataError.none});
}
