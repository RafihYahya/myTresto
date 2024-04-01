import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14,letterSpacing: 1.2),
                indicatorColor: AppColor.trestoRed,
                tabs: tabs),
            body: TabBarView(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                  height: 55,
                                  child: OutlinedButton(
                                      style:  ButtonStyle(
                                        side: const MaterialStatePropertyAll(
                                            BorderSide(
                                                color: AppColor.trestoRed)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0))),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'New Client',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: AppColor.trestoblack90)),
                                      ))),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: 55,
                                  child: OutlinedButton(
                                      style: ButtonStyle(
                                        side: MaterialStatePropertyAll(BorderSide(color: Colors.grey[300]!)),
                                        shape: MaterialStatePropertyAll(
                                          
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0))),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'New Client',
                                        style: GoogleFonts.poppins(
                                            textStyle:  TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Colors.grey[400]!)),
                                      ))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: TextField(
                          
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.trestoRed
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                              )
                            ),
                            label: const Text('Nom Du Clients'),
                            border: const OutlineInputBorder(
                                
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: TextField(
                          
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.trestoRed
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                              )
                            ),
                            label: const Text('Nom Du Clients'),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                        ),
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
