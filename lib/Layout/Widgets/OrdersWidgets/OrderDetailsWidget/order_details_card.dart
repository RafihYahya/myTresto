import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsCard extends StatelessWidget {
  final Color bgColor;
  const OrderDetailsCard({
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            height: MediaQuery.of(context).size.width > 1080 ? null : 335,
            child: Card(
              color: bgColor,
              elevation: 0,
              child: Column(
                children: [
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  image: DecorationImage(fit: BoxFit.cover,image: Image.asset('assets/Burger-11.webp').image),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: null,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'BigCheeseBorgar',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  'Cafe Choco',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Text(
                                  '3 Commandes',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          '30\$',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sous Total',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w400)),
                        ),
                        Text(
                          '42 Dhs',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Frais Total',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w400)),
                        ),
                        Text(
                          '65 Dhs',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Prix',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          '80 Dhs',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
