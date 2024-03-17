
enum NetworkStatus {normal,error,loading,success}
enum ApiStatus {normal,error,loading,success}
enum NotificationStatus {normal,failed,arrived,success}
enum LoginStatus{loggedIn,loggedOut}

class AppStatus {
  final NetworkStatus networkStatus;
  final ApiStatus apiStatus;
  final NotificationStatus notifStatus;
  final LoginStatus loginStatus;

  AppStatus({
    required this.apiStatus,
    required this.notifStatus,
    required this.networkStatus,
    required this.loginStatus
  });
}