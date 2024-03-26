import 'package:tresto_v002a/LOGIC/Providers/Api/dashboard_data_provider.dart';
import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';
import 'package:tresto_v002a/LOGIC/Providers/LocalStorage/auth_provider.dart';
import 'package:tresto_v002a/mock_data_testing.dart';

class DashBoardRepository {
  DashBoardRepository();
  final DashBoardRestoListProvider dashBoard = DashBoardRestoListProvider();
  final AuthProvider authProvider = AuthProvider();

  // Implement your repository methods here
  //usually a function that use the provider functions to retrieve data and convert it to the class appropriatly

  Future<DashBoardRestoList> getDashboardData() async {
    // var dashboardList = await dashBoard.getDashboardDataFromApi();
    return dashboardFull; // await _dashBoard.getDashBoardFullListData();
  }

  Future<String> retrieveTokenIfExist() async {
    return await authProvider.getTokenFromStorage();
  }
}
