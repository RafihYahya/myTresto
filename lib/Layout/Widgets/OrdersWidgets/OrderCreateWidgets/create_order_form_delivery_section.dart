import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';

class CreateOrderFormDeliverySection extends StatefulWidget {
  const CreateOrderFormDeliverySection({
    super.key,
  });

  @override
  State<CreateOrderFormDeliverySection> createState() =>
      _CreateOrderFormDeliverySectionState();
}

List<String> listOfZoneValue = ['Empty For Now'];
List<String> listOfTableValue = ['You Have No Table'];
List<String> listOfImportDelayValue = ['Empty Time For Now'];
List<String> listOfDelayValue = [
  '11:30 - 12:00',
  '12:00 - 12:30',
  '12:30 - 13:00',
  '13:00 - 13:30',
  '13:30 - 14:00',
  '14:00 - 14:30',
  '14:30 - 15:00',
  '15:00 - 15:30',
  '15:30 - 16:00',
  '16:00 - 16:30',
  '16:30 - 17:00',
  '17:00 - 17:30',
];

class _CreateOrderFormDeliverySectionState
    extends State<CreateOrderFormDeliverySection> {
  @override
  Widget build(BuildContext context) {
    return switch (context.watch<OrderFormCubit>().state.deliveryMethodIndex) {
      0 => const OnDeliveryForm(),
      1 => const OnImportForm(),
      2 => const OnImmediateForm(),
      _ => const SizedBox(),
    };
  }
}

class OnDeliveryForm extends StatelessWidget {
  const OnDeliveryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField(
              menuMaxHeight: MediaQuery.of(context).size.height * 0.75,
              isExpanded: true,
              hint: Text(
                '-- Sélectionnez une zone --',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              ),
              borderRadius: BorderRadius.circular(12.0),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                floatingLabelStyle: const TextStyle(color: AppColor.trestoRed),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(color: Colors.grey[400]!),
                label: Text(
                  'Zone de livraison',
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
              items: listOfZoneValue
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
                    SelectedValues(selectedZoneValue: value));
              },
              onChanged: (value) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedZoneValue: value));
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField(
              menuMaxHeight: MediaQuery.of(context).size.height * 0.75,
              isExpanded: true,
              hint: Text(
                "-- Sélectionnez l'heure --",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              ),
              borderRadius: BorderRadius.circular(12.0),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                floatingLabelStyle: const TextStyle(color: AppColor.trestoRed),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(color: Colors.grey[400]!),
                label: Text(
                  'Delai de livraison',
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
              items: listOfDelayValue
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w500)),
                      )))
                  .toList(),
              onSaved: (newValue) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedDelayValue: newValue));
              },
              onChanged: (value) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedDelayValue: value));
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.trestoRed)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                  )),
              floatingLabelStyle: const TextStyle(color: AppColor.trestoRed),
              labelStyle: TextStyle(color: Colors.grey[400]!),
              label: Text(
                ' Adresse',
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
      ],
    ).animate().fade();
  }
}

//
class OnImportForm extends StatelessWidget {
  const OnImportForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField(
              menuMaxHeight: MediaQuery.of(context).size.height * 0.75,
              isExpanded: true,
              hint: Text(
                "-- Sélectionnez l'heure --",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              ),
              borderRadius: BorderRadius.circular(12.0),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                floatingLabelStyle: const TextStyle(color: AppColor.trestoRed),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(color: Colors.grey[400]!),
                label: Text(
                  'Pick up time',
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
              items: listOfImportDelayValue
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w500)),
                      )))
                  .toList(),
              onSaved: (newValue) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedTimeValue: newValue));
              },
              onChanged: (value) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedTimeValue: value));
              }),
        ),
      ],
    ).animate().fade();
  }
}

class OnImmediateForm extends StatelessWidget {
  const OnImmediateForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField(
              menuMaxHeight: MediaQuery.of(context).size.height * 0.75,
              isExpanded: true,
              hint: Text(
                "-- Select Table --",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              ),
              borderRadius: BorderRadius.circular(12.0),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                floatingLabelStyle: const TextStyle(color: AppColor.trestoRed),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(color: Colors.grey[400]!),
                label: Text(
                  'Table',
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
              items: listOfTableValue
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w500)),
                      )))
                  .toList(),
              onSaved: (newValue) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedTableValue: newValue));
              },
              onChanged: (value) {
                context.read<OrderFormCubit>().updateSelectedValues(
                    SelectedValues(selectedTableValue: value));
              }),
        ),
      ],
    ).animate().fade();
  }
}
