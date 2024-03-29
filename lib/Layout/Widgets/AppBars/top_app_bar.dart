import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/Layout/Widgets/CustomUtils/custom_alert_auth_dialogue.dart';
import 'package:tresto_v002a/Layout/Widgets/CustomUtils/custom_loading.dart';
import 'package:tresto_v002a/Layout/Widgets/navbar_popup_menu.dart';

class AlternativeCNavBar extends StatelessWidget {
  final bool showresto;
  final bool autoLead;

  const AlternativeCNavBar(
      {super.key, required this.autoLead, required this.showresto});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndexesCubit, AppIndexes>(
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Error Happened While Changing Restaurant, Please Retry',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            backgroundColor: AppColor.colorIndexTrestoList[
                context.watch<AppSettingsCubit>().state.colorIndex],
          ));
        }
      },
      builder: (context, stateIndex) {
        return BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, stateDash) {
            return AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: autoLead,
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
                      stateIndex.index != 2 && stateIndex.index != 3
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.colorIndexTrestoList25[context.watch<AppSettingsCubit>().state.colorIndex] //Color.fromRGBO(255, 237, 244, 1),
                              ),
                              child: Row(
                                children: [
                                  context.watch<IndexesCubit>().state.status ==
                                              Status.loading ||
                                          context
                                                  .watch<IndexesCubit>()
                                                  .state
                                                  .status ==
                                              Status.error
                                      ? const Padding(
                                          padding: EdgeInsets.only(right: 16.0),
                                          child: CustomLoading(
                                            height: 10,
                                            width: 10,
                                          ),
                                        )
                                      : Text(
                                          context
                                                  .watch<DashboardBloc>()
                                                  .restoListCollector()
                                                  .isEmpty
                                              ? 'Loading'
                                              : context
                                                      .read<DashboardBloc>()
                                                      .restoListCollector()[
                                                  stateIndex.restoIndex],
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              textStyle: TextStyle(
                                                  color: AppColor
                                                          .colorIndexTrestoList[
                                                      context
                                                          .read<AppSettingsCubit>()
                                                          .state
                                                          .colorIndex]))),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  context
                                          .watch<DashboardBloc>()
                                          .restoListCollector()
                                          .isEmpty
                                      ? const SizedBox()
                                      : const NavPopupMenu(),
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
                                builder: (context) => const CustomAuthAlert());
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
