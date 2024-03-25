import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterNotificationPlugin.initialize(initializationSettings);
  }

  static void displayNotifs(int id, String title,String body) async {
    final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(id.toString(), 'channelName',
            importance: Importance.max, priority: Priority.max));
    await flutterNotificationPlugin.show(
        id, title, body, notificationDetails);
  }
}
