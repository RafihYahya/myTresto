import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_settings.dart';
import 'package:tresto_v002a/LOGIC/Repositories/app_settings_repo.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  // main setting cubit for the entire application
  //hopefully allowing users in the future to modify the app settings
  final AppSettingsRepository settingsRepo;
  AppSettingsCubit(super.initialState, this.settingsRepo);

  //implement function that update and change the  state 
}
