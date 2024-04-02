import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';

class CreateOrderFormDeliverySection extends StatefulWidget {
  final String? selectedValue;
  const CreateOrderFormDeliverySection({
    super.key,
    required this.selectedValue,
  });

  @override
  State<CreateOrderFormDeliverySection> createState() =>
      _CreateOrderFormDeliverySectionState();
}

List<String> listOfValue = ['1', '2', '3', '4', '5'];

class _CreateOrderFormDeliverySectionState
    extends State<CreateOrderFormDeliverySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField(
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
              items: listOfValue
                  .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e)))
                  .toList(),
                  onSaved: (value) {
                 
               },
              onChanged: (value) {
                
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField(
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
              items: const [
                DropdownMenuItem(
                  value: "miaw",
                  child: Text('miaw'),
                ),
                DropdownMenuItem(
                  value: "miaw",
                  child: Text('miaw'),
                ),
                DropdownMenuItem(
                  value: "miaw",
                  child: Text('miaw'),
                ),
                DropdownMenuItem(
                  value: "miaw",
                  child: Text('miaw'),
                ),
              ],
              onChanged: (value) {
                print(value);
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
    );
  }
}
