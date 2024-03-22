import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/constants.dart';

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
                            const HeroIcon(HeroIcons.shoppingBag,size: 20,),
                            const SizedBox(width: 2.0,),
                            Text(
                              'Commande',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(width: 6.0,),
                            Text(
                              '#137465',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0,),
                        Text(
                          'Thursday, January 31, 2008	',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 10.0)),
                        ),
                      ],
                    ),
                    Text(
                      'En Attentes',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                               color: AppColor.trestoRed)),
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
