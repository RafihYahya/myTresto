import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider {
  static const myLocalSecureStorage = FlutterSecureStorage();

  Future<String> getTokenFromStorage() async {
    return await myLocalSecureStorage.read(key: 'authToken') ?? '';
  }

  Future<void> setTokenToStorage(String value) async {
    await myLocalSecureStorage.write(key: 'authToken', value: value);
  }
}
