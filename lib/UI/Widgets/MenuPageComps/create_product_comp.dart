import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/constants.dart';

class CreateProductComp extends StatelessWidget {
  const CreateProductComp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Stack(alignment: Alignment.center, children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 175,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: null,
                ),
                const Center(
                    child: Icon(
                  Icons.add,
                  size: 54,
                ))
              ]),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w400)),
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 13.0,
                            color: AppColor.trestoRed,
                            fontWeight: FontWeight.w500)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.trestoRed, width: 2)),
                    border: const UnderlineInputBorder(),
                    labelText: 'Product Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w400)),
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 13.0,
                                  color: AppColor.trestoRed,
                                  fontWeight: FontWeight.w500)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.trestoRed, width: 2)),
                          border: const UnderlineInputBorder(),
                          labelText: 'Product Type',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w400)),
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 13.0,
                                  color: AppColor.trestoRed,
                                  fontWeight: FontWeight.w500)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.trestoRed, width: 2)),
                          border: const UnderlineInputBorder(),
                          labelText: 'Product Price',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28.0,
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: null, // Set this
                  expands: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: AppColor.textGrey1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: AppColor.trestoRed),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Container(
                height: 55,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColor.trestoRed),
                child: Center(
                    child: Text(
                  'Add Product',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: AppColor.mainTextWhite)),
                )),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
