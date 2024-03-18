
import 'package:http/http.dart' as http;

class DashBoardRestoListProvider {
  DashBoardRestoListProvider();
  //dashboard provider used to get pretty mcuh all application datat as raw data from the relevant api
  //
  static String apiUrl = 'Put Url here';
  static String apiUrlTest = 'https://tresto.ma/api/test';
  Future<http.Response> getDashBoardFullListData() async {
    return await http.get(Uri.parse(apiUrl));
  }

  Future<String> test() async {
    final response =  await http.get(Uri.parse(apiUrlTest));
    await Future.delayed(const Duration(seconds: 1));
    return response.body;
  }
}
