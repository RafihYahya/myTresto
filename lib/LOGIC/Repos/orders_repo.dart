import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';
import 'package:tresto_v002a/LOGIC/Providers/Api/order_data_provider.dart';
import 'package:tresto_v002a/LOGIC/Providers/LocalStorage/auth_provider.dart';
import 'package:tresto_v002a/Debug/mock_data_testing.dart';

class OrdersRepository {
  OrdersRepository();
  final OrderRestoListProvider orders = OrderRestoListProvider();
  final AuthProvider authProvider = AuthProvider();
  

  Future<OrderRestoList> getOrderData() async {
    //var ordersList = await orders.getOrdersDataFromApi();
    return ordersFull; // await _dashBoard.getDashBoardFullListData();
  }

  Future<bool> checkAnyNewOrdersAreAvailable() async{
    await Future.delayed(const Duration(seconds: 2));
    
    return true;    
  }

  
}
