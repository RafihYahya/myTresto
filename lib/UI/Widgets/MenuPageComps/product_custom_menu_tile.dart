import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/constants.dart';

class ProductCustomMenuTile extends StatelessWidget {
  const ProductCustomMenuTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 250,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 32.0,
          ),
          Container(
            height: 105,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        Images.restoImgUrl))),
            child: null,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Toxic Spagethi',
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 32.0),
            child: Text(
              'Description is describing the description of the product',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 10.0,
              )),
            ),
          )
        ],
      ),
    );
  }
}
