import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';
import 'package:tresto_v002a/Layout/Pages/Orders/create_order_page.dart';

class FormActionsButtons extends StatelessWidget {
  const FormActionsButtons({
    super.key,
    required this.nameCtrl,
    required this.phoneCtrl,
    required this.adrsCtrl,
  });

  final TextEditingController nameCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController adrsCtrl;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, -15, 0),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.greenAccent,
              content: Text(
                'Fields Cleared',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87)),
              )));
          nameCtrl.clear();
          phoneCtrl.clear();
          adrsCtrl.clear();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Annuler',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: AppColor.trestoRed)),
              ),
              const SizedBox(
                width: 45,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FilledButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.trestoRed),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))))),
                      onPressed: () {
                        if (context.read<OrderFormCubit>().theGrandValidator([
                          formKey1,
                          formKey2,
                          formKey3,
                          formKey4,
                          formKey5,
                        ])) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.yellow,
                              content: Text(
                                'Work In Progress',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500)),
                              )));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                'Some Field Were Left Out',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              )));
                        }
                      },
                      child: Text(
                        'Enregistrer les changements',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
