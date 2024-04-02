import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';

class OutlineButtonFullWidth extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String title;
  final Icon icon;
  final int initialValue;
  const OutlineButtonFullWidth({
    required this.borderColor,
    required this.title,
    required this.textColor,
    required this.icon,
    required this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: OutlinedButton(
                  style: ButtonStyle(
                    surfaceTintColor:
                        const MaterialStatePropertyAll(AppColor.trestoRed025),
                    overlayColor:
                        const MaterialStatePropertyAll(AppColor.trestoRed025),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: borderColor)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                  ),
                  onPressed: () {
                    context
                        .read<OrderFormCubit>()
                        .changeDeliveryIndex(initialValue);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      icon,
                      const SizedBox(width: 4.0),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: textColor)),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
