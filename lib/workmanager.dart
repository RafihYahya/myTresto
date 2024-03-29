import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/notif_init.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() async {
  Workmanager().executeTask((task, inputData) async {
    try {
      LocalNotifications.displayNotifs(10, 'New Orders Have Arrived','Click To See All');
      return Future.value(true);
    } catch (e) {
      logger.w('Error In WorkManager Execution');
      return Future.value(false);
    }
    //simpleTask will be emitted here.
  });
}

class WorkManager {
  static void startWorkManager() {
    Workmanager().initialize(
        callbackDispatcher, // The top level function, aka callbackDispatcher
        isInDebugMode:
            false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
    Workmanager().registerPeriodicTask("SendReminder", "simpleTask",
        existingWorkPolicy: ExistingWorkPolicy.replace,
        tag: 'NewOrderCheck',
        frequency: const Duration(minutes: 15));
  }
}
