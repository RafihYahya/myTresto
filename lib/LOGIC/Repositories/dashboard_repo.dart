import 'dart:convert';

import 'package:tresto_v002a/LOGIC/DataProviders/Api/dashboard_data_provider.dart';
import 'package:tresto_v002a/LOGIC/DataProviders/Api/token_provider.dart';
import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';
import 'package:tresto_v002a/mock_data_testing.dart';

class DashBoardRepository {
  DashBoardRepository();
  final DashBoardRestoListProvider dashBoard =
      DashBoardRestoListProvider();

  final TokenProvider tokenProvider = TokenProvider();
  // Implement your repository methods here
  //usually a function that use the provider functions to retrieve data and convert it to the class appropriatly

  Future<DashBoardRestoList> getDashboardData() async {
    await dashBoard.test();
    return dashboardFull; // await _dashBoard.getDashBoardFullListData();
  }

  Future<String> getTokenData(String email, String password) async {
    final response = await tokenProvider.getTokenRaw(email, password);
    return jsonDecode(response.body)['session'];
  }
}
