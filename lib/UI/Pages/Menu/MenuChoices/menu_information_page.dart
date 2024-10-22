import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/constants.dart';
import 'package:tresto_v002a/UI/Widgets/MenuPageComps/menu_information_image_comp.dart';

class MenuInformationPage extends StatelessWidget {
  const MenuInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 24.0,
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 24.0,
                    ),
                  ],
                ),
                InformationImageComp(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 24.0,
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    FaIcon(
                      FontAwesomeIcons.xTwitter,
                      size: 24.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28.0),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Restaurant Name :",
                  style: GoogleFonts.poppins(
                      textStyle:  const TextStyle(
                                              color: AppColor.trestoRed,

                          fontWeight: FontWeight.w600, fontSize: 12)),
                ),
                Text(
                  "RestoA",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28.0),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Owner Name :",
                  style: GoogleFonts.poppins(
                      textStyle:  const TextStyle(
                                              color: AppColor.trestoRed,

                          fontWeight: FontWeight.w600, fontSize: 12)),
                ),
                Text(
                  "Hamza",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description :",
                style: GoogleFonts.poppins(
                    textStyle:  const TextStyle(
                      color: AppColor.trestoRed,
                        fontWeight: FontWeight.w600, fontSize: 12)),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              margin: const EdgeInsets.symmetric(horizontal: 28.0),
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white),
              child: null),
        const SizedBox(
            height: 12,
          ),
        ],
        
      ),
    );
  }
}
