import 'package:flutter/material.dart';
import 'package:tresto_v002a/UI/Widgets/DashBoardComp/dashboard_chart_loading.dart';
import 'package:tresto_v002a/UI/Widgets/DashBoardComp/dashboard_tile_loading.dart';

class DashboardLoading extends StatelessWidget {
  const DashboardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: DashboardMainTileLoading()),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(child: DashboardMainTileLoading()),
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DashboardMainTileLoading(),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(child: DashboardMainTileLoading()),
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 12.0,
          ),
          DashboardChartLoading()
        ],
      ),
    );
  }
}
