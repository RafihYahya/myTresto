import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_state.dart';
import 'package:tresto_v002a/LOGIC/Models/DashBoard_RestoModels/dashboard_data.dart';
import 'package:tresto_v002a/LOGIC/Models/OrderModels/order_data.dart';
import 'package:tresto_v002a/LOGIC/Models/DashBoard_RestoModels/resto_info.dart';
import 'package:tresto_v002a/LOGIC/Repositories/dashboard_repos.dart';
import 'package:tresto_v002a/mock_data_testing.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  //
  final DashBoardRepository dashRepo;

  DashBoardCubit(super.initialState, this.dashRepo);

//

//

  Future<void> getDashBoardFullListData() async {
    dynamic temp = await dashRepo.getDashboardData();
    emit(state.dashboardData.dashBoardFull = temp.dashBoardFull);
  }

  Future<void> getToken() async {
    emit(state.copyWith(
        dashBoardStateApiEnum: DashBoardStateApiEnum.loading,
        dashboardData: state.dashboardData,
        authToken: state.authToken));
    String temp =
        await dashRepo.getTokenData('test2@gmail.com', 'test2@gmail.com');
    emit(state.copyWith(
        dashBoardStateApiEnum: DashBoardStateApiEnum.success,
        dashboardData: dashboardfull,
        authToken: temp));
  }

  List<RestoInfo?> addIndexToEnd(List<RestoInfo?> list) {
    int i = 0;
    List<RestoInfo?> temp = [];
    for (final e in list) {
      temp.add(RestoInfo(
          restoName: (e!.restoName! + i.toString()),
          ownerName: e.ownerName,
          cityLocation: e.cityLocation,
          description: e.description));
      i++;
    }
    return temp;
  }

  void updateAuthToken(dynamic authtoken) {
    emit(state.copyWith(
        dashBoardStateApiEnum: state.dashBoardStateApiEnum,
        dashboardData: state.dashboardData,
        token: authtoken));
  }

  void addRestoToDashList(RestoInfo resto) {
    // Make A repo APi call here using the repos
    //
    //if api call is successful we do this
    if (state.dashBoardStateApiEnum == DashBoardStateApiEnum.success) {
      state.dashboardData.dashBoardFull.add(DashBoardListTileData(
          restoInfo: RestoInfo(
              restoName: resto.restoName ??
                  'No Data${state.dashboardData.restoList.length}',
              ownerName: resto.ownerName ?? 'No Data',
              cityLocation: resto.cityLocation ?? 'No Data',
              description: resto.description ?? 'No Data'),
          dashList: [
            DashboardTileData(number: 0, title: 'title'),
            DashboardTileData(number: 0, title: 'title'),
            DashboardTileData(number: 0, title: 'title'),
            DashboardTileData(number: 0, title: 'title')
          ]));
      state.dashboardData.orderslistFull.ordersFullList
          .add(OrderDataList(ordersList: []));

      emit(state.copyWith(
          dashboardData: state.dashboardData,
          dashBoardStateApiEnum: DashBoardStateApiEnum.success));
    }
    //if Api Call Failed Then We do this
    else if (state.dashBoardStateApiEnum == DashBoardStateApiEnum.failure) {
      emit(
          state.copyWith(dashBoardStateApiEnum: DashBoardStateApiEnum.failure));
    }
  }
}
