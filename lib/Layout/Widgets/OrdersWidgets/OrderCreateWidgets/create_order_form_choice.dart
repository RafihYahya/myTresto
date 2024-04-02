import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';

class CreateOrderFormChoice extends StatelessWidget {
  const CreateOrderFormChoice({
    super.key,
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
                        color: (context.watch<OrderFormCubit>().state.isClient)
                            ? AppColor.trestoRed
                            : Colors.grey[300]!)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                  ),
                  onPressed: () {
                    context.read<OrderFormCubit>().toggleisClient(true);
                  },
                  child: Text(
                    'New Client',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color:
                                (context.watch<OrderFormCubit>().state.isClient)
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
                        color: !(context.watch<OrderFormCubit>().state.isClient)
                            ? AppColor.trestoRed
                            : Colors.grey[300]!)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                  ),
                  onPressed: () {
                    context.read<OrderFormCubit>().toggleisClient(false);
                  },
                  child: Text(
                    'Existing Client',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: !(context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .isClient)
                                ? AppColor.trestoblack90
                                : Colors.grey[400]!)),
                  ))),
        ),
      ],
    );
  }
}
