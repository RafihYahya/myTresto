import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Models/GlobalModeles/app_status.dart';

class AppStatusCubit extends Cubit<AppStatus> {
  //Cubit Responsible for Application main Status
  //shall be used for internet checks and more
  AppStatusCubit()
      : super(AppStatus(
            apiStatus: ApiStatus.success,
            notifStatus: NotificationStatus.normal,
            networkStatus: NetworkStatus.normal,
            loginStatus: LoginStatus.loggedIn));
}
