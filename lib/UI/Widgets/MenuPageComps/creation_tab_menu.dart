import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/constants.dart';

class CreationTabsMenu extends StatelessWidget {
  final Function updateIndex;
  final int index;
  const CreationTabsMenu({
    super.key,
    required this.index,
    required this.updateIndex
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 16.0,
        ),
        GestureDetector(
          onTap: () => updateIndex(0),
          child: Container(
            margin: const EdgeInsets.symmetric(
                vertical: 4.0, horizontal: 2.0),
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: index == 0 ? AppColor.trestoRed : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
                child: Text(
              'Restaurants',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: index == 0? AppColor.mainTextWhite : AppColor.trestoRed,
                fontSize: 12,
              )),
            )),
          ),
        ),
        const SizedBox(
          width: 1.0,
        ),
        GestureDetector(
          onTap: () => updateIndex(1),
          child: Container(
            margin: const EdgeInsets.symmetric(
                vertical: 4.0, horizontal: 2.0),
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: index == 1 ? AppColor.trestoRed:Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
                child: Text(
              'Products',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: index == 1 ? AppColor.mainTextWhite : AppColor.trestoRed,
                fontSize: 12,
              )),
            )),
          ),
        ),
      ],
    );
  }
}