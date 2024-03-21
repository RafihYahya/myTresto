import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tresto_v002a/Global/constants.dart';

class AuthProvider {
  static const myLocalSecureStorage = FlutterSecureStorage();

  Future<String> getTokenFromStorage() async {
    return await myLocalSecureStorage.read(key: LocalStorageConsts.authToken) ??
        '';
  }

  Future<void> setTokenToStorage(String value) async {
    await myLocalSecureStorage.write(
        key: LocalStorageConsts.authToken, value: value);
  }

  Future<bool> checkTokenExist(String key) async {
    var temp = await myLocalSecureStorage.read(key: key);
    if (temp?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}
