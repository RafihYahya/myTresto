import 'dart:convert';

import 'package:tresto_v002a/LOGIC/Providers/Api/token_provider.dart';
import 'package:tresto_v002a/LOGIC/Providers/LocalStorage/auth_provider.dart';

final class AuthRepository {
  final TokenProvider tokenProvider = TokenProvider();
  final AuthProvider authProvider = AuthProvider();
  Future<String> getTokenData(String email, String password) async {
    var localAuth = await authProvider.getTokenFromStorage();

    if (localAuth.isEmpty) {
      final response = await tokenProvider.getTokenRaw(email, password);
      print(response.body);
      var usableToken = jsonDecode(response.body)['token'];
      await authProvider.setTokenToStorage(usableToken);
      return usableToken;
    } else {
      return await authProvider.getTokenFromStorage();
    }
  }

  Future<void> setTokenToValue(String value) async {
    await authProvider.setTokenToStorage(value);
  }
}
