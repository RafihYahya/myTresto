enum AppStatusNetwork { working, failure }

enum AppStatusApi { working, failure }

enum AppStatusLocalStorage { working, failure }

enum AppStatusLogin { loggedIn, loggedOut }

final class AppStatusState {
  final AppStatusApi apiStatus;
  final AppStatusLocalStorage localStorageStatus;
  final AppStatusNetwork networkStatus;
  final AppStatusLogin loginStatus;

  AppStatusState({
    required this.apiStatus,
    required this.localStorageStatus,
    required this.networkStatus,
    required this.loginStatus,
  });

  AppStatusState copyWith({
    AppStatusApi? apiStatus,
    AppStatusLocalStorage? localStorageStatus,
    AppStatusNetwork? networkStatus,
    AppStatusLogin? loginStatus,
  }) {
    return AppStatusState(
        apiStatus: apiStatus ?? this.apiStatus,
        localStorageStatus: localStorageStatus ?? this.localStorageStatus,
        networkStatus: networkStatus ?? this.networkStatus,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  AppStatusState.initial({
   this.apiStatus = AppStatusApi.working,
     this.localStorageStatus = AppStatusLocalStorage.working,
     this.networkStatus = AppStatusNetwork.working,
     this.loginStatus = AppStatusLogin.loggedOut,
  });
}
