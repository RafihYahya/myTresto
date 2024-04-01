import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

final List<Widget> tabs = [
  const Tab(text: 'Client'),
  const Tab(text: 'Produit'),
];

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Builder(builder: ((context) {
          return Scaffold(
            appBar: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColor.trestoRed,
                unselectedLabelColor: Colors.black87,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                indicatorColor: AppColor.trestoRed,
                tabs: tabs),
            body: TabBarView(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24,),
                      Text(
                        'Create Order',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                        

                      ),
                      TextFormField(
                        
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox()
            ]),
          );
        })));
  }
}
