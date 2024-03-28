import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';

class DashboardMainTile extends StatelessWidget {
  final int fadeDelay;
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
      required this.fadeDelay,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexesCubit, AppIndexes>(
      builder: (context, state) {
        return Container(
                  width: 190,
                  height: 110,
                  decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(12.0)),
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
                        Text(
                            context
                                .watch<DashboardBloc>()
                                .state
                                .dashBoardRestoList
                                .dashBoardRestoList[state.restoIndex]
                                .dashBoardList[index]
                                .number
                                .toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: textColor),
                            )).animate().fade(),
                        const SizedBox(
                          height: 1.0,
                        ),
                        Text(
                            context
                                .watch<DashboardBloc>()
                                .state
                                .dashBoardRestoList
                                .dashBoardRestoList[state.restoIndex]
                                .dashBoardList[index]
                                .title,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                            )).animate().fade(),
                      ],
                    ),
                  ),
                ).animate().fade(
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 300),
                      delay: Duration(milliseconds: fadeDelay),
                    
        );
      },
    );
  }
}

/* class MyCustomLoader extends StatelessWidget {
  const MyCustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: 190,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CustomLoading()),
        ));
  }
} */
