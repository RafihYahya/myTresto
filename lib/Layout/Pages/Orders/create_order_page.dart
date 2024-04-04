import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/OrderForm/order_form_cubit.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/create_order_form_choice.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/create_order_form_delivery_section.dart';
import 'package:tresto_v002a/Layout/Widgets/OrdersWidgets/OrderCreateWidgets/form_actions_buttons.dart';
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

final formKey1 = GlobalKey<FormState>();
final formKey2 = GlobalKey<FormState>();
final formKey3 = GlobalKey<FormState>();
final formKey4 = GlobalKey<FormState>();
final formKey5 = GlobalKey<FormState>();

class _CreateOrderState extends State<CreateOrder> {
  final List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    for (var e in controllers) {
      e.addListener(() {
        logger.i('miaw miaw ${e.text}');
      });
    }
  }

  @override
  void dispose() {
    for (var e in controllers) {
      e.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var [nameCtrl, phoneCtrl, adrsCtrl] = controllers;
    return DefaultTabController(
        length: 2,
        child: Builder(builder: ((context) {
          return Scaffold(
            appBar: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColor.trestoRed,
                unselectedLabelColor: Colors.black87,
                labelStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                )),
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
                        child: const CreateOrderFormChoice().animate().fade(),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      NewClientFormCreateOrder(
                        nameController: nameCtrl,
                        phoneController: phoneCtrl,
                      ),
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
                        borderColor: context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .deliveryMethodIndex ==
                                0
                            ? AppColor.trestoRed
                            : Colors.grey[300]!,
                        title: 'Livraison',
                        textColor: context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .deliveryMethodIndex ==
                                0
                            ? Colors.black87
                            : Colors.grey[300]!,
                        icon: Icon(
                          Icons.delivery_dining_outlined,
                          color: context
                                      .watch<OrderFormCubit>()
                                      .state
                                      .deliveryMethodIndex ==
                                  0
                              ? Colors.black87
                              : Colors.grey[300]!,
                          size: 24,
                        ),
                      ).animate().fade(),
                      const SizedBox(
                        height: 12.0,
                      ),
                      OutlineButtonFullWidth(
                        initialValue: 1,
                        borderColor: context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .deliveryMethodIndex ==
                                1
                            ? AppColor.trestoRed
                            : Colors.grey[300]!,
                        title: 'A Importer',
                        textColor: context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .deliveryMethodIndex ==
                                1
                            ? Colors.black87
                            : Colors.grey[300]!,
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: context
                                      .watch<OrderFormCubit>()
                                      .state
                                      .deliveryMethodIndex ==
                                  1
                              ? Colors.black87
                              : Colors.grey[300]!,
                          size: 24,
                        ),
                      )
                          .animate()
                          .fade(delay: const Duration(milliseconds: 100)),
                      const SizedBox(
                        height: 12.0,
                      ),
                      OutlineButtonFullWidth(
                        initialValue: 2,
                        borderColor: context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .deliveryMethodIndex ==
                                2
                            ? AppColor.trestoRed
                            : Colors.grey[300]!,
                        title: 'Sur Place',
                        textColor: context
                                    .watch<OrderFormCubit>()
                                    .state
                                    .deliveryMethodIndex ==
                                2
                            ? Colors.black87
                            : Colors.grey[300]!,
                        icon: Icon(
                          Icons.place_outlined,
                          color: context
                                      .watch<OrderFormCubit>()
                                      .state
                                      .deliveryMethodIndex ==
                                  2
                              ? Colors.black87
                              : Colors.grey[300]!,
                          size: 24,
                        ),
                      )
                          .animate()
                          .fade(delay: const Duration(milliseconds: 200)),
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
                        adresseController: adrsCtrl,
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
                      FormActionsButtons(
                          nameCtrl: nameCtrl,
                          phoneCtrl: phoneCtrl,
                          adrsCtrl: adrsCtrl,
                          ),
                      const SizedBox(
                        height: 18.0,
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'You have no categories yet',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87)),
                        ),
                      ),
                      Transform(
                          transform: Matrix4.translationValues(-10, -12, 0),
                          child: const OrderDetailsCard(
                            bgColor: Colors.transparent,
                          )),
                      FormActionsButtons(
                          nameCtrl: nameCtrl,
                          phoneCtrl: phoneCtrl,
                          adrsCtrl: adrsCtrl,
                          )
                    ],
                  ),
                ),
              ),
            ]),
          );
        })));
  }
}
