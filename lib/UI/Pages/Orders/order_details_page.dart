import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/LOGIC/Models/OrderModels/order_details_data.dart';
import 'package:tresto_v002a/Globals/constants.dart';

class OrderDetailsView extends StatelessWidget {
  final OrderDetails details;
  const OrderDetailsView({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: const Size.fromHeight(50.0), child: AppBar()),
      backgroundColor: Colors.grey[100],
      // backgroundColor: AppColor.primaryBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 20),
                        child: Text('Commande Details',
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            )),
                      ),
                      Card(
                        //           shape: RoundedRectangleBorder(
                        // side: const BorderSide(
                        //   width: 0.5,
                        //   color: Colors.grey,
                        // ),
                        // borderRadius: BorderRadius.circular(10),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.shopping_bag_outlined),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text("Commande",
                                        style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                        )),
                                  ),
                                  Text(details.id.toString(),
                                      style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 21,
                                      )),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("En attente",
                                            style: GoogleFonts.rubik(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17,
                                                textStyle: const TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.orange))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Text(details.dateProduct,
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      textStyle:
                                          const TextStyle(color: Colors.grey))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        //           shape: RoundedRectangleBorder(
                        // side: const BorderSide(
                        //   width: 0.5,
                        //   color: Colors.grey,
                        // ),
                        // borderRadius: BorderRadius.circular(10),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("commande",
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: AssetImage(Images.cafe),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(details.productTitle,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('Cafe',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.grey)),
                                          const Text('+ chocolat',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          details.productQuantity.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(details.price.toString(),
                                                  style: GoogleFonts.rubik(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .black))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Sous-Total",
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          )),
                                      Text("42 dhs",
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Frais De Livraison",
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          )),
                                      Text(details.priceDelivery.toString(),
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 30, 15, 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Prix",
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              textStyle: const TextStyle(
                                                  color: Colors.black))),
                                      Text(details.productPriceSum.toString(),
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              textStyle: const TextStyle(
                                                  color: Colors.black))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CardCustomerInfo(details: details),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AcceptOrRejectCard(details: details)
        ],
      ),
    );
  }
}

class CardCustomerInfo extends StatelessWidget {
  const CardCustomerInfo({
    super.key,
    required this.details,
  });

  final OrderDetails details;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text("Infos concernant le client",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(details.clientName,
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      textStyle: const TextStyle(color: Colors.black))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Row(
                children: [
                  Text("Client invite",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textStyle: const TextStyle(color: Colors.black54))),
                  const SizedBox(
                    width: 15,
                  ),
                  Text("1 Commande",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textStyle: const TextStyle(color: Colors.red))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Telephone",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textStyle: const TextStyle(color: Colors.grey))),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(details.clientTelephone,
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                textStyle:
                                    const TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Adresse",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textStyle: const TextStyle(color: Colors.grey))),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(details.clientAdress,
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                textStyle:
                                    const TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_shipping_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Zone Livraison",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textStyle: const TextStyle(color: Colors.grey))),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Hay Salam",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                textStyle:
                                    const TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(
                    Icons.room_service_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Methode Livraison",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textStyle: const TextStyle(color: Colors.grey))),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Emporter",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                textStyle:
                                    const TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AcceptOrRejectCard extends StatelessWidget {
  const AcceptOrRejectCard({
    super.key,
    required this.details,
  });

  final OrderDetails details;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              details.status,
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                textStyle: const TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          print('reject');
                          Navigator.of(context).pop();
                        },
                        child: Text("Rejeter",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                textStyle: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          print('Accept');
                          Navigator.of(context).pop();
                          
                        },
                        child: Text("Accepter",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                textStyle: const TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
