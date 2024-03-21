part of 'app_status_bloc.dart';

@immutable
sealed class AppStatusEvent {}

final class CheckNetworkStatus extends AppStatusEvent {}

final class UpdateApiStatus extends AppStatusEvent {}

final class CheckLocalStorageStatus extends AppStatusEvent {}

final class UpdateLoginStatus extends AppStatusEvent {
  final AppStatusLogin status;
  UpdateLoginStatus({
    required this.status,
  });
}

final class BypassLogin extends AppStatusEvent {
  final String key;
  BypassLogin({required this.key});
}
