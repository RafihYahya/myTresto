import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/constants.dart';
import 'package:tresto_v002a/Globals/webview_url_consts.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_cubit.dart';

class NavPopupMenu extends StatefulWidget {
  const NavPopupMenu({super.key});

  @override
  State<StatefulWidget> createState() => _NavPopupMenuState();
}

class _NavPopupMenuState extends State<NavPopupMenu> {
  bool reverseIcon = false;
  void reverseIconReverser() {
    setState(() {
      reverseIcon = !reverseIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor:
            AppColor.textGrey1Half, // Change this to your desired hover color
      ),
      child: PopupMenuButton(
          onOpened: () {
            reverseIconReverser(); // this basically show and hide the popup on click
          },
          onSelected: (value) {
            reverseIconReverser(); // this basically show and hide the popup on click
          },
          onCanceled: () {
            reverseIconReverser(); // this basically show and hide the popup on click
          },
          position: PopupMenuPosition.under,
          color: const Color.fromRGBO(196, 48, 71,
              0.95), //const Color.fromRGBO(0, 0, 0, 0.95), //colors['MainTextWhite'],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: const Icon(
            Icons.storefront,
            color: AppColor.primaryColor,
          ),
          itemBuilder: (context) => BlocProvider.of<DashBoardCubit>(context)
              .addIndexToEnd(BlocProvider.of<DashBoardCubit>(context)
                  .state
                  .dashboardData
                  .restoList)
              .map(
                (e) => PopupMenuItem(
                    onTap: () async {
                      await headlessView(
                          BlocProvider.of<DashBoardCubit>(context)
                                  .state
                                  .dashboardData
                                  .restoList
                                  .length -
                              1,
                          e.restoName!);
                      setState(() {
                        BlocProvider.of<IndexesCubit>(context).changeRestoIndex(
                            restoIndex: int.parse((e.restoName!.substring(
                                (e.restoName!.length - 1),
                                //The reason we use substring and substract -1 is because the string also contain the index
                                //for exemple restoA0, restoB1 ,restoC2
                                // we use substring to remove the index
                                //or equivalently we extract the index to use it for routing
                                e.restoName!
                                    .length)))); //ref.read(mainAppData2Provider.notifier).changeRestoIndex(int.parse((e.substring((e.length - 1), e.length)))) ;.
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Center(
                          child: Text(
                        e!.restoName!.substring(
                            0, e.restoName!.length - 1), //Same as Above
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: AppColor.mainTextWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      )),
                    )),
              )
              .toList()),
    );
  }
}
