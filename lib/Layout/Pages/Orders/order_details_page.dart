import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: const Stack(alignment: Alignment.bottomCenter, children: [
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 8.0,
                ),
                CommandIdCard(),
                SizedBox(
                  height: 4.0,
                ),
                OrderDetailsCard(
                  bgColor: Colors.white,
                ),
                SizedBox(
                  height: 4.0,
                ),
                ClientDataCard(),
                SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 24.0,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: CallToAction(),
        ),
      ]),
    );
  }
}

class CallToAction extends StatelessWidget {
  const CallToAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                SystemSound.play(SystemSoundType.click);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.yellow,
                    content: Text(
                      'Work In Progress',
                      style: TextStyle(color: Colors.black87),
                    )));
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Text(
                  'Accept',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500,color: Colors.white)),
                )),
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                SystemSound.play(SystemSoundType.click);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.yellow,
                    content: Text(
                      'As I Said , Its Work In Progress',
                      style: TextStyle(color: Colors.black87),
                    )));
              },
              child: Container(
                height: 55,
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
          ),
        ],
      ),
    );
  }
}
