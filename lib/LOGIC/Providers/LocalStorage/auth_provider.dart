import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tresto_v002a/Global/constants.dart';

class AuthProvider {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  Future<void> writeToSecureStorage(String? value) async {
    await storage.write(key: LocalStorageConsts.authToken, value: value);
  }

  Future<String?> readFromSecureStorage() async {
    String? temp = await storage.read(key: LocalStorageConsts.authToken);
    return temp;
  }

  Future<bool> isExistKeySecureStorage(String key) async {
    String? temp = await storage.read(key: key);
    if (temp == null) {
      return false;
    } else {
      return true;
    }
  }
}
