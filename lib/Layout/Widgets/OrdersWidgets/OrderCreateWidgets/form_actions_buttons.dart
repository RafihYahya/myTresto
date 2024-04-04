import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';
import 'package:tresto_v002a/Layout/Pages/Orders/create_order_page.dart';

class FormActionsButtons extends StatefulWidget {
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
  State<FormActionsButtons> createState() => _FormActionsButtonsState();
}

class _FormActionsButtonsState extends State<FormActionsButtons> {
  var keys = [
    formKey1,
    formKey2,
    formKey3,
    formKey4,
    formKey5,
  ];

  void resetAllDropDownFields() {
    widget.nameCtrl.clear();
    widget.phoneCtrl.clear();

    context.read<OrderFormCubit>().clearTheDropDownFieldValues(keys);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderFormCubit, OrderFormState>(
      listener: (context, state) {
        switch (state.netState) {
          case FormRequestState.idle:
            null;
          case FormRequestState.loading:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.yellowAccent,
                duration: const Duration(seconds: 1),
                content: Text(
                  'Please Wait A Second',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                )));
          case FormRequestState.success:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.greenAccent,
                duration: const Duration(seconds: 2),
                content: Text(
                  'Order Created Successfully',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                )));
          case FormRequestState.error:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.greenAccent,
                duration: const Duration(seconds: 1),
                content: Text(
                  'An Error Has Occurred, Please Try Again',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                )));

          default:
            null;
        }
      },
      child: Transform(
        transform: Matrix4.translationValues(0, -15, 0),
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.greenAccent,
                duration: const Duration(seconds: 1),
                content: Text(
                  'Fields Cleared',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                )));

            resetAllDropDownFields();
            setState(() {
              widget.adrsCtrl.text = "";
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0))))),
                        onPressed: () async {
                          if (context
                              .read<OrderFormCubit>()
                              .theGrandValidator(keys)) {
                            await context
                                .read<OrderFormCubit>()
                                .createNewOrder();

                            resetAllDropDownFields();
                            setState(() {
                              widget.adrsCtrl.text = "";
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.redAccent,
                                duration: const Duration(seconds: 1),
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
                        child: context.watch<OrderFormCubit>().state.netState ==
                                FormRequestState.loading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                            : Text(
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
      ),
    );
  }
}
