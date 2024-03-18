import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/LOGIC/Models/dashboard_model.dart';

class DashboardMainTile extends StatelessWidget {
  final Color tileColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color iconsColor;
  final HeroIcons icon;
  final DashboardTileData data;
  const DashboardMainTile(
      {super.key,
      required this.tileColor,
      required this.textColor,
      required this.secondaryTextColor,
      required this.data,
      required this.iconsColor,
      required this.icon
      });

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
            const SizedBox(height: 4.0,),
            Text(data.number.toString(),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                )),
            const SizedBox(
              height: 1.0,
            ),
            Text(data.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: secondaryTextColor),
                )),
            
            
          ],
        ),
      ),
    );
  }
}
