import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';

class CommandIdCard extends StatelessWidget {
  const CommandIdCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const HeroIcon(
                              HeroIcons.shoppingBag,
                              color: Colors.black87,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              'Commande',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87
                                      )),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              '#137465',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Thursday, January 31, 2008	',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 10.0)),
                        ),
                      ],
                    ),
                    Text(
                      'En Attente',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: AppColor.colorIndexTrestoList[context
                                  .watch<AppSettingsCubit>()
                                  .state
                                  .colorIndex])),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
