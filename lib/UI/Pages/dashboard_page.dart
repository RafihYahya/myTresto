import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Globals/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_state.dart';
import 'package:tresto_v002a/LOGIC/Models/GlobalModeles/app_indexes_data.dart';
import 'package:tresto_v002a/UI/Widgets/DashBoardComp/dashboard_chart.dart';
import 'package:tresto_v002a/UI/Widgets/DashBoardComp/dashboard_tile.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({
    super.key,
  });

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int selectedIndex = 1;
  void updateSelectedIndex(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final List<FlSpot> dummyData1 = List.generate(7, (index) {
      return FlSpot(index.toDouble(), index * Random().nextDouble() * 2000);
    });
    final List<FlSpot> dummyData2 = List.generate(9, (index) {
      return FlSpot(index.toDouble(), index * Random().nextDouble() * 2250);
    });
    final List<FlSpot> dummyData3 = List.generate(6, (index) {
      return FlSpot(index.toDouble(), index * Random().nextDouble() * 2500);
    });

    final List<List<FlSpot>> dummyListData = [
      dummyData1,
      dummyData2,
      dummyData3
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BlocBuilder<IndexesCubit, AppIndexes>(
                    builder: (context, stateIndex) {
                      return BlocBuilder<DashBoardCubit, DashBoardState>(
                        builder: (context, stateDash) {
                          return DashboardMainTile(
                            data:
                                stateDash.dashboardData.dashBoardFull.length >
                                        stateIndex.restoIndex 
                                    ? stateDash
                                        .dashboardData
                                        .dashBoardFull[stateIndex.restoIndex]
                                        ?.dashList[0]
                                    : null,
                            tileColor: Colors.white,
                            iconsColor: Colors.pink,
                            textColor: const Color(0xFF141414),
                            secondaryTextColor: AppColor.textGrey1,
                            icon: HeroIcons.shoppingBag,
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: BlocBuilder<IndexesCubit, AppIndexes>(
                    builder: (context, stateIndex) {
                      return BlocBuilder<DashBoardCubit, DashBoardState>(
                        builder: (context, stateDash) {
                          return DashboardMainTile(
                            data:
                                stateDash.dashboardData.dashBoardFull.length >
                                        stateIndex.restoIndex 
                                    ? stateDash
                                        .dashboardData
                                        .dashBoardFull[stateIndex.restoIndex]
                                        ?.dashList[1]
                                    : null,
                            tileColor: Colors.white,
                            iconsColor: Colors.green,
                            textColor: const Color(0xFF141414),
                            secondaryTextColor: AppColor.textGrey1,
                            icon: HeroIcons.banknotes,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BlocBuilder<IndexesCubit, AppIndexes>(
                    builder: (context, stateIndex) {
                      return BlocBuilder<DashBoardCubit, DashBoardState>(
                        builder: (context, stateDash) {
                          return DashboardMainTile(
                              data: stateDash
                                          .dashboardData.dashBoardFull.length >
                                      stateIndex.restoIndex 
                                  ? stateDash
                                      .dashboardData
                                      .dashBoardFull[stateIndex.restoIndex]
                                      ?.dashList[2]
                                  : null,
                              tileColor: Colors.white,
                              iconsColor: Colors.purple,
                              textColor: const Color(0xFF141414),
                              secondaryTextColor: AppColor.textGrey1,
                              icon: HeroIcons.arrowPathRoundedSquare);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: BlocBuilder<IndexesCubit, AppIndexes>(
                    builder: (context, stateIndex) {
                      return BlocBuilder<DashBoardCubit, DashBoardState>(
                        builder: (context, stateDash) {
                          return DashboardMainTile(
                            data:
                                stateDash.dashboardData.dashBoardFull.length >
                                        stateIndex.restoIndex 
                                    ? stateDash
                                        .dashboardData
                                        .dashBoardFull[stateIndex.restoIndex]
                                        ?.dashList[3]
                                    : null,
                            tileColor: Colors.white,
                            iconsColor: Colors.blue,
                            textColor: const Color(0xFF141414),
                            secondaryTextColor: AppColor.textGrey1,
                            icon: HeroIcons.eye,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Revenue',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF141414)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last 30 Days',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 11,
                                )),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const HeroIcon(
                                HeroIcons.calendar,
                                style: HeroIconStyle.outline,
                                size: 16,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 28.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const HeroIcon(
                                HeroIcons.chartBar,
                                style: HeroIconStyle.outline,
                                size: 14.0,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '2580',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ),
                            ],
                          ),
                          Text(
                            'Total Sales',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.0)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const HeroIcon(
                                HeroIcons.chartPie,
                                style: HeroIconStyle.outline,
                                size: 14.0,
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                '70.00',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ),
                            ],
                          ),
                          Text(
                            'Average Sales',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.0)),
                          ),
                        ],
                      ),
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white),
                      height: screenWidth < 1280
                          ? screenWidth * (11 / 16)
                          : screenWidth * (5 / 16),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: DashboardChart(
                          selectedIndex: selectedIndex,
                          data: dummyListData[selectedIndex],
                        ),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
