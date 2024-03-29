class AppSettings {
  final bool isDarkMode;
  final double textSize;
  final double appScale;
  final bool isNotificationOn;
  final bool stayLoggedIn;
  final int colorIndex;

  AppSettings(
      {required this.isDarkMode,
      required this.textSize,
      required this.appScale,
      required this.isNotificationOn,
      required this.stayLoggedIn,
      required this.colorIndex});

  AppSettings copyWith({
    bool? isDarkMode,
    double? textSize,
    double? appScale,
    bool? isNotificationOn,
    bool? stayLoggedIn,
    int? colorIndex,
  }) {
    return AppSettings(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        textSize: textSize ?? this.textSize,
        appScale: appScale ?? this.appScale,
        isNotificationOn: isNotificationOn ?? this.isNotificationOn,
        stayLoggedIn: stayLoggedIn ?? this.stayLoggedIn,
        colorIndex: colorIndex ?? this.colorIndex);
  }

  const AppSettings.initial({
    this.isDarkMode = false,
    this.textSize = 12.0,
    this.appScale = 1.0,
    this.isNotificationOn = true,
    this.stayLoggedIn = true,
    this.colorIndex = 5,
  });
}
