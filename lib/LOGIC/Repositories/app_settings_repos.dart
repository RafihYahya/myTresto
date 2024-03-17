import 'package:tresto_v002a/LOGIC/DataProviders/LocalStorage/appsettings_provider.dart';

class AppSettingsRepository {
  AppSettingsRepository();
  final AppSettingsProvider settingsProvider = AppSettingsProvider();
  // Implement your repository methods here
  //usually a function that use the provider functions to retrieve data and convert it to the class appropriatly
}