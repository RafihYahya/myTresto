part of 'app_status_bloc.dart';

@immutable
sealed class AppStatusEvent {}

final class CheckNetworkStatus extends AppStatusEvent {
  CheckNetworkStatus();
}

final class CheckApiStatus extends AppStatusEvent {
  CheckApiStatus();
}

final class CheckLocalStorageStatus extends AppStatusEvent {
  CheckLocalStorageStatus();
}
