import 'package:http/http.dart' as http;

class OrderRestoListProvider {
  OrderRestoListProvider();
  //order provider that might be used to retrieve raw data from api 
  //I said might cause we might not use it in future
  static String apiUrl = 'Put Url here';
  Future<http.Response> getOrdersFullListData() async {
    return await  http.get(Uri.parse(apiUrl));
  }
}