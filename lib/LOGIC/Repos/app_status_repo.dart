import 'dart:convert';

import 'package:tresto_v002a/LOGIC/Providers/Api/token_provider.dart';

final class AppStatusRepository {
  final TokenProvider tokenProvider = TokenProvider();

  Future<String> getTokenData(String email, String password) async {
    final response = await tokenProvider.getTokenRaw(email, password);
    return jsonDecode(response.body)['session'];
  }
}
