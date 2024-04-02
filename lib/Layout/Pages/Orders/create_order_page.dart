import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/create_order_form_choice.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/create_order_form_delivery_section.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/new_client_form_create_order.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/outline_button_full_width.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderDetailsWidget/order_details_card.dart';

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
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  bool isClient = false;
  int deliveryMethodIndex = 0;
  String? dropDownDeliverySelectedValue;
  void toggleIsClient(bool value) {
    setState(() {
      isClient = value;
    });
  }

  void changeDeliveryIndex(int index) {
    setState(() {
      deliveryMethodIndex = index;
    });
  }

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
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
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
                        child: CreateOrderFormChoice(
                          isClient: isClient,
                          togglebool: toggleIsClient,
                        ),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      NewClientFormCreateOrder(myFocusNode: myFocusNode),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          'Method De Livraison',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      OutlineButtonFullWidth(
                        initialValue: 0,
                        changeIndex: changeDeliveryIndex,
                        borderColor: deliveryMethodIndex == 0
                            ? AppColor.trestoRed
                            : Colors.grey[300]!,
                        title: 'Livraison',
                        textColor: deliveryMethodIndex == 0
                            ? Colors.black87
                            : Colors.grey[300]!,
                        icon: Icon(
                          Icons.delivery_dining_outlined,
                          color: deliveryMethodIndex == 0
                              ? Colors.black87
                              : Colors.grey[300]!,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      OutlineButtonFullWidth(
                        initialValue: 1,
                        changeIndex: changeDeliveryIndex,
                        borderColor: deliveryMethodIndex == 1
                            ? AppColor.trestoRed
                            : Colors.grey[300]!,
                        title: 'A Importer',
                        textColor: deliveryMethodIndex == 1
                            ? Colors.black87
                            : Colors.grey[300]!,
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: deliveryMethodIndex == 1
                              ? Colors.black87
                              : Colors.grey[300]!,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      OutlineButtonFullWidth(
                        initialValue: 2,
                        changeIndex: changeDeliveryIndex,
                        borderColor: deliveryMethodIndex == 2
                            ? AppColor.trestoRed
                            : Colors.grey[300]!,
                        title: 'Sur Place',
                        textColor: deliveryMethodIndex == 2
                            ? Colors.black87
                            : Colors.grey[300]!,
                        icon: Icon(
                          Icons.place_outlined,
                          color: deliveryMethodIndex == 2
                              ? Colors.black87
                              : Colors.grey[300]!,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          'Informations de livraison',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      CreateOrderFormDeliverySection(
                        selectedValue: dropDownDeliverySelectedValue,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          'Détails de la commande',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                        ),
                      ),
                      Transform(
                          transform: Matrix4.translationValues(-10, -10, 0),
                          child: const OrderDetailsCard(
                            bgColor: Colors.transparent,
                          )),
                      Transform(
                        transform: Matrix4.translationValues(0, -15, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Annuler',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: AppColor.trestoRed)),
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: FilledButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  AppColor.trestoRed),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))))),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.yellow,
                                                content: Text(
                                                  'Work In Progress',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )));
                                      },
                                      child: Text(
                                        'Enregistrer les changements',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.white)),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18.0,
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
