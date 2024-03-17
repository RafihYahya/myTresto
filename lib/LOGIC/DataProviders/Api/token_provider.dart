import 'package:http/http.dart' as http;

class TokenProvider {
  TokenProvider();
  final String apiUrl = '';
  Future<http.Response> getTokenRaw(String email, String password) async {
    Map<String, String> formDataMap = {};
    formDataMap['email'] = email;
    formDataMap['password'] = password;
    return await http.post(
        Uri.parse('https://tresto.ma/api/v2/vendor/auth/gettoken'),
        body: formDataMap);
  }
}
