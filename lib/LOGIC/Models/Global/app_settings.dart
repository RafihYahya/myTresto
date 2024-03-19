
class AppSettings {
  final bool isDarkMode;
  final double textSize;
  final double appScale;
  final bool isNotificationOn;
  final bool stayLoggedIn;

  AppSettings(
      {required this.isDarkMode,
      required this.textSize,
      required this.appScale,
      required this.isNotificationOn,
      required this.stayLoggedIn
      });

      const AppSettings.initial({
        this.isDarkMode = false,
        this.textSize = 12.0,
        this.appScale = 1.0,
        this.isNotificationOn = true,
        this.stayLoggedIn = true,
      });
}
