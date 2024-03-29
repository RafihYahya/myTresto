import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_settings.dart';
import 'package:tresto_v002a/LOGIC/Repos/app_settings_repo.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  // main setting cubit for the entire application
  //hopefully allowing users in the future to modify the app settings
  final AppSettingsRepository settingsRepo;
  AppSettingsCubit(super.initialState, this.settingsRepo);

  //implement function that update and change the  state

  void changeSettings({double? fontSize, double? appScale, bool? notifOn,
      bool? darkOn, bool? remLogin, int? colorIndex}) {
    emit(state.copyWith(
        isDarkMode: darkOn,
        isNotificationOn: notifOn,
        colorIndex: colorIndex,
        stayLoggedIn: remLogin,
        textSize: fontSize,
        appScale: appScale));
  }
}
