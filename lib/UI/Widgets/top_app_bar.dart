import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_state.dart';
import 'package:tresto_v002a/LOGIC/Models/GlobalModeles/app_indexes_data.dart';
import 'package:tresto_v002a/Globals/constants.dart';
import 'package:tresto_v002a/UI/Widgets/custom_alert_dialogue.dart';
import 'package:tresto_v002a/UI/Widgets/navbar_popup_menu.dart';

class AlternativeCNavBar extends StatelessWidget {
  final bool showresto;

  const AlternativeCNavBar({super.key, required this.showresto});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexesCubit, AppIndexes>(
      builder: (context, stateIndex) {
        return BlocBuilder<DashBoardCubit, DashBoardState>(
          builder: (context, stateDash) {
            return AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(Images.imgLink),
                    fit: BoxFit.cover,
                    height: 24,
                  ),
                  Row(
                    children: [
                      BlocProvider.of<IndexesCubit>(context).state.index != 2
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.primaryColor1,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                      stateDash
                                          .dashboardData
                                          .restoList[stateIndex.restoIndex]!
                                          .restoName!,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          textStyle: const TextStyle(
                                              color: AppColor.primaryColor))),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const NavPopupMenu(),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => const CustomAlert());
                          },
                          child: const HeroIcon(
                            HeroIcons.arrowLeftEndOnRectangle,
                            size: 24.0,
                          ))
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
