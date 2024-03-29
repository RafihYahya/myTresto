import 'dart:convert';

import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Providers/Api/token_provider.dart';
import 'package:tresto_v002a/LOGIC/Providers/LocalStorage/auth_provider.dart';

final class AuthRepository {
  final TokenProvider tokenProvider = TokenProvider();
  final AuthProvider authProvider = AuthProvider();
  Future<String> getTokenData(String email, String password) async {
    final response = await tokenProvider.getTokenRaw(email, password);
    logger.d(response.body);
    var usableToken = jsonDecode(response.body)['token'];
    //await authProvider.setTokenToStorage(usableToken);
    return usableToken;
  }

  Future<void> setTokenToValue(String? value) async {
    await authProvider.writeToSecureStorage(value);
  }

  Future<void> setSessionToValue(String value) async {
  }

  Future<String?> readTokenValue() async {
    return await authProvider.readFromSecureStorage();
  }

  Future<void> deleteTokenValue() async {
    await authProvider.deleteTokenSecureStorage();
  }

}
