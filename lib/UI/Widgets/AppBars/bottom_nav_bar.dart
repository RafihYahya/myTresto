import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';

class BotNavBarAlternative extends StatelessWidget {
  const BotNavBarAlternative({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexesCubit, AppIndexes>(
      builder: (context, state) {
        return Container(
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 35,
                decoration: BoxDecoration(
                    color: state.index == 0
                        ? AppColor.trestoRed25
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                    BlocProvider.of<IndexesCubit>(context)
                        .changeIndex(index: 0);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.home,
                        style: HeroIconStyle.outline,
                        color: state.index == 0 ? Colors.red : Colors.grey,
                        size: 28.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: state.index == 0 ? 70 : 0,
                        child: Text(
                          softWrap: false,
                          'Dashboard',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 35,
                decoration: BoxDecoration(
                    color: state.index == 1
                        ? AppColor.trestoRed25
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                    BlocProvider.of<IndexesCubit>(context)
                        .changeIndex(index: 1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.shoppingBag,
                        style: HeroIconStyle.outline,
                        color: state.index == 1 ? Colors.red : Colors.grey,
                        size: 28.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: state.index == 1 ? 45 : 0,
                        child: Text(
                          softWrap: false,
                          'Orders',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 35,
                decoration: BoxDecoration(
                    color: state.index == 2
                        ? AppColor.trestoRed25
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                    BlocProvider.of<IndexesCubit>(context)
                        .changeIndex(index: 2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.plus,
                        style: HeroIconStyle.outline,
                        color: state.index == 2 ? Colors.red : Colors.grey,
                        size: 28.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: state.index == 2 ? 45 : 0,
                        child: Text(
                          softWrap: false,
                          'Create',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 35,
                decoration: BoxDecoration(
                    color: state.index == 3
                        ? AppColor.trestoRed25
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                    BlocProvider.of<IndexesCubit>(context)
                        .changeIndex(index: 3);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.listBullet,
                        style: HeroIconStyle.outline,
                        color: state.index == 3 ? Colors.red : Colors.grey,
                        size: 28.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: state.index == 3 ? 40 : 0,
                        child: Text(
                          softWrap: false,
                          'Menu',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: state.index == 3 ? Colors.red : Colors.grey,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
