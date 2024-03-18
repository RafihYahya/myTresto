import 'package:tresto_v002a/Global/constants.dart';

class AppSettings {
  final bool isDarkMode;
  final AppColor appColor;
  final double textSize;
  final double appScale;
  final bool isNotificationOn;
  final bool stayLoggedIn;

  AppSettings(
      {required this.isDarkMode,
      required this.appColor,
      required this.textSize,
      required this.appScale,
      required this.isNotificationOn,
      required this.stayLoggedIn
      });
}
