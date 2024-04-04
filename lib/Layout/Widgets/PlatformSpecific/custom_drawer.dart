import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width * 0.20,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                BlocProvider.of<IndexesCubit>(context).changeIndex(index: 0);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 55,
                decoration: BoxDecoration(
                    color: context.watch<IndexesCubit>().state.index == 0
                        ? const Color.fromRGBO(244, 67, 54, 0.10)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroIcon(
                      HeroIcons.home,
                      style: HeroIconStyle.outline,
                      color: context.watch<IndexesCubit>().state.index == 0
                          ? Colors.black87
                          : Colors.grey,
                      size: 28.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 70,
                      child: Text(
                        softWrap: false,
                        'Dashboard',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.watch<IndexesCubit>().state.index == 0
                              ? Colors.black87
                              : Colors.grey[400]!,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                BlocProvider.of<IndexesCubit>(context).changeIndex(index: 1);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 55,
                decoration: BoxDecoration(
                    color: context.watch<IndexesCubit>().state.index == 1
                        ? const Color.fromRGBO(244, 67, 54, 0.10)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroIcon(
                      HeroIcons.shoppingBag,
                      style: HeroIconStyle.outline,
                      color: context.watch<IndexesCubit>().state.index == 1
                          ? Colors.black87
                          : Colors.grey,
                      size: 28.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 70,
                      child: Text(
                        softWrap: false,
                        'Orders',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.watch<IndexesCubit>().state.index == 1
                              ? Colors.black87
                              : Colors.grey[400]!,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                BlocProvider.of<IndexesCubit>(context).changeIndex(index: 2);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 55,
                decoration: BoxDecoration(
                    color: context.watch<IndexesCubit>().state.index == 2
                        ? const Color.fromRGBO(244, 67, 54, 0.10)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroIcon(
                      HeroIcons.plus,
                      style: HeroIconStyle.outline,
                      color: context.watch<IndexesCubit>().state.index == 2
                          ? Colors.black87
                          : Colors.grey,
                      size: 28.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 70,
                      child: Text(
                        softWrap: false,
                        'Create',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.watch<IndexesCubit>().state.index == 2
                              ? Colors.black87
                              : Colors.grey[400]!,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                BlocProvider.of<IndexesCubit>(context).changeIndex(index: 3);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                height: 55,
                decoration: BoxDecoration(
                    color: context.watch<IndexesCubit>().state.index == 3
                        ? const Color.fromRGBO(244, 67, 54, 0.10)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroIcon(
                      HeroIcons.listBullet,
                      style: HeroIconStyle.outline,
                      color: context.watch<IndexesCubit>().state.index == 3
                          ? Colors.black87
                          : Colors.grey,
                      size: 28.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 70,
                      child: Text(
                        softWrap: false,
                        'Menu',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.watch<IndexesCubit>().state.index == 3
                              ? Colors.black87
                              : Colors.grey[400]!,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
