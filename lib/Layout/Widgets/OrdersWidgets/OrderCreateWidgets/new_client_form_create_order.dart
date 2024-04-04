import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';
import 'package:tresto_v002a/Layout/Pages/Orders/create_order_page.dart';

class NewClientFormCreateOrder extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const NewClientFormCreateOrder({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  @override
  State<NewClientFormCreateOrder> createState() =>
      _NewClientFormCreateOrderState();
}

List<String> listOfClientValue = ['Empty Client For Now'];

class _NewClientFormCreateOrderState extends State<NewClientFormCreateOrder> {
  @override
  Widget build(BuildContext context) {
    return switch (context.watch<OrderFormCubit>().state.isClient) {
      false => Form(
          key: formKey2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    logger.i('Validation Working ');
                    return 'You Must Select Something';
                  }
                  return null;
                },
                menuMaxHeight: MediaQuery.of(context).size.height * 0.75,
                isExpanded: true,
                hint: Text(
                  '-- Sélectionnez une client --',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                ),
                borderRadius: BorderRadius.circular(12.0),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  floatingLabelStyle:
                      const TextStyle(color: AppColor.trestoRed),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(color: Colors.grey[400]!),
                  label: Text(
                    'Clients',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: AppColor.trestoRed)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      )),
                ),
                items: listOfClientValue
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w500)),
                        )))
                    .toList(),
                onSaved: (value) {
                  context.read<OrderFormCubit>().updateSelectedValues(
                      SelectedValues(selectedClientValue: value));
                },
                onChanged: (value) {
                  context.read<OrderFormCubit>().updateSelectedValues(
                      SelectedValues(selectedClientValue: value));
                }),
          ).animate().fade(),
        ),
      true => Form(
          key: formKey1,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: TextFormField(
                  controller: widget.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      logger.i('Validation Working ');
                      return 'Must Not Be Empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: AppColor.trestoRed)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        )),
                    floatingLabelStyle:
                        const TextStyle(color: AppColor.trestoRed),
                    labelStyle: TextStyle(color: Colors.grey[400]!),
                    label: Text(
                      'Nom Du Client',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      
                      logger.i('Validation Working ');
                      return 'Must Not Be Empty';
                    }
                    return null;
                  },
                  controller: widget.phoneController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: AppColor.trestoRed,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        )),
                    floatingLabelStyle:
                        const TextStyle(color: AppColor.trestoRed),
                    labelStyle: TextStyle(color: Colors.grey[400]!),
                    label: Text(
                      'Numero du telephone',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  ),
                ),
              ).animate().fade(),
            ],
          ),
        ),
    };
  }
}
