part of 'app_status_bloc.dart';

@immutable
sealed class AppStatusEvent {}

final class CheckNetworkStatus extends AppStatusEvent {}

final class CheckApiStatus extends AppStatusEvent {}

final class CheckLocalStorageStatus extends AppStatusEvent {}

final class CheckLoginStatus extends AppStatusEvent {}

final class GetToken extends AppStatusEvent {}
