import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderDetailsWidget/order_client_info_card.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderDetailsWidget/order_command_card.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderDetailsWidget/order_details_card.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Image(
          image: AssetImage(Images.imgLink),
          fit: BoxFit.cover,
          height: 24,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 8.0,
              ),
              const CommandIdCard(),
              const SizedBox(
                height: 4.0,
              ),
              const OrderDetailsCard(),
              const SizedBox(
                height: 4.0,
              ),
              const ClientDataCard(),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Text(
                          'Accept',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500)),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Text(
                          'Reject',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500)),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
