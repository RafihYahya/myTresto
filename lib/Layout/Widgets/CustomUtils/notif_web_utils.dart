// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as web;


Future<void> showNotificationWeb(String message) async {
  var permission = web.Notification.permission;
  if (permission != 'granted') {
    permission = await web.Notification.requestPermission();
  }
  if (permission == 'granted') {
    web.Notification(message);
  }
}
