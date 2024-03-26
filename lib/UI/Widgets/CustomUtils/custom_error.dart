import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';

class CustomError extends StatefulWidget {
  const CustomError({super.key});

  @override
  State<CustomError> createState() => _CustomErrorState();
}

class _CustomErrorState extends State<CustomError> {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          
      'An Error Has Occurred Please Check Your Internet Connection and Try Again, If The Problem Persist, Please Contact Us.',
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: AppColor.trestoRed,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      )),
    ));
  }
}
