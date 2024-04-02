import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';

class CreateOrderFormChoice extends StatelessWidget {
  final bool isClient;
  final Function togglebool;
  const CreateOrderFormChoice({
    super.key,
    required this.isClient,
    required this.togglebool,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
              height: 55,
              child: OutlinedButton(
                  style: ButtonStyle(
                    surfaceTintColor:
                        const MaterialStatePropertyAll(AppColor.trestoRed),
                    overlayColor:
                        const MaterialStatePropertyAll(AppColor.trestoRed025),
                    side: MaterialStatePropertyAll(BorderSide(
                        color:
                            isClient ? AppColor.trestoRed : Colors.grey[300]!)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                  ),
                  onPressed: () {
                    togglebool(true);
                  },
                  child: Text(
                    'New Client',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: isClient
                                ? AppColor.trestoblack90
                                : Colors.grey[400]!)),
                  ))),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: SizedBox(
              height: 55,
              child: OutlinedButton(
                  style: ButtonStyle(
                    surfaceTintColor:
                        const MaterialStatePropertyAll(AppColor.trestoRed),
                    overlayColor:
                        const MaterialStatePropertyAll(AppColor.trestoRed025),
                    side: MaterialStatePropertyAll(BorderSide(
                        color: !isClient
                            ? AppColor.trestoRed
                            : Colors.grey[300]!)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                  ),
                  onPressed: () {
                    togglebool(false);
                  },
                  child: Text(
                    'Existing Client',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: !isClient
                                ? AppColor.trestoblack90
                                : Colors.grey[400]!)),
                  ))),
        ),
      ],
    );
  }
}
