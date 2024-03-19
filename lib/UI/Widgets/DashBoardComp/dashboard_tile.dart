import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';
import 'package:tresto_v002a/UI/Widgets/CustomUtils/custom_error.dart';
import 'package:tresto_v002a/UI/Widgets/CustomUtils/custom_loading.dart';

class DashboardMainTile extends StatelessWidget {
  final int index;
  final Color tileColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color iconsColor;
  final HeroIcons icon;
  const DashboardMainTile(
      {super.key,
      required this.tileColor,
      required this.textColor,
      required this.secondaryTextColor,
      required this.iconsColor,
      required this.index,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 110,
      decoration: BoxDecoration(
          color: tileColor, borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroIcon(
              icon,
              style: HeroIconStyle.solid,
              color: iconsColor,
              size: 22,
            ),
            const SizedBox(
              height: 4.0,
            ),
            BlocBuilder<IndexesCubit, AppIndexes>(
              builder: (context, state) {
                return BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, stateDash) {
                    return switch (stateDash.status) {
                      DashboardStateStatus.error => CustomError(),
                      DashboardStateStatus.loading => CustomLoading(),
                      DashboardStateStatus.ready => Text(
                          context
                              .read<DashboardBloc>()
                              .state
                              .dashBoardRestoList
                              .dashBoardRestoList[state.restoIndex]
                              .dashBoardList[index]
                              .number
                              .toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor),
                          )),
                      DashboardStateStatus.initial => Text(''),
                    };
                  },
                );
              },
            ),
            const SizedBox(
              height: 1.0,
            ),
            BlocBuilder<IndexesCubit, AppIndexes>(
              builder: (context, state) {
                return BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, stateDash) {
                    return switch (stateDash.status) {
                      DashboardStateStatus.error => CustomError(),
                      DashboardStateStatus.loading => CustomLoading(),
                      DashboardStateStatus.ready => Text(
                          context
                              .read<DashboardBloc>()
                              .state
                              .dashBoardRestoList
                              .dashBoardRestoList[state.restoIndex]
                              .dashBoardList[index]
                              .title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor),
                          )),
                      DashboardStateStatus.initial => Text(''),
                    };
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
