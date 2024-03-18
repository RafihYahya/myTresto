part of 'app_status_bloc.dart';

@immutable
sealed class AppStatusEvent {}

final class CheckNetwork extends AppStatusEvent {
  CheckNetwork();
}

final class CheckApi extends AppStatusEvent {
  CheckApi();
}

final class CheckLocalStorage extends AppStatusEvent {
  CheckLocalStorage();
}
