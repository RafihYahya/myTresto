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
    logger.w(await myLocalSecureStorage.read(key: LocalStorageConsts.authToken));
  }

  Future<void> setSessionToStorage(String value) async {
    await myLocalSecureStorage.write(
        key: LocalStorageConsts.sessionToken, value: value);
    logger.w(
        await myLocalSecureStorage.read(key: LocalStorageConsts.sessionToken));
  }

  Future<bool> checkTokenExist(String key) async {
    var temp = await myLocalSecureStorage.read(key: key);
    logger.w(temp);
    if (temp == 'null' || temp == null) {
      return false;
    } else {
      return true;
    }
  }
}
