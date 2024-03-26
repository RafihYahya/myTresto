import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Orders/orders_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';
import 'package:tresto_v002a/UI/Widgets/CustomUtils/custom_alert_dialogue.dart';
import 'package:tresto_v002a/UI/Widgets/CustomUtils/custom_error.dart';
import 'package:tresto_v002a/UI/Widgets/CustomUtils/custom_loading.dart';
import 'package:tresto_v002a/UI/Widgets/OrderComp/custom_order_tile.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrdersBloc>(context).add(GetOrders());
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is OrdersError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColor.trestoRed,
              content: Text(
                'Something Wrong Has Occured',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              )));
          showDialog(
              context: context, builder: (builder) => const CustomAlert());
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          HeroIcon(
                            HeroIcons.checkCircle,
                            style: HeroIconStyle.solid,
                            size: 21,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Online Orders",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // color:showAvg? Colors.black:Colors.white
                                color: Colors.green),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list_alt,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "All Orders",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<IndexesCubit, AppIndexes>(
              builder: (context, stateIndex) {
                return BlocBuilder<OrdersBloc, OrdersState>(
                  builder: (context, state) {
                    return switch (state) {
                      OrdersInitial() => const MyCustomOrderLoader(),
                      OrdersError() => const CustomError(),
                      OrdersLoading() => const MyCustomOrderLoader(),
                      OrdersReady() => ListView.builder(
                          itemCount: state
                              .ordersRestoList
                              .ordersRestoList[stateIndex.restoIndex]
                              .ordersList
                              .length,
                          itemBuilder: (context, index) => CustomOrdersTile(
                                orders: state
                                    .ordersRestoList
                                    .ordersRestoList[stateIndex.restoIndex]
                                    .ordersList[index],
                              )).animate().fade(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300)),
                    };
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomOrderLoader extends StatelessWidget {
  const MyCustomOrderLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(height: 100, width: 200, child: CustomLoading(width: 20,height: 20,)));
  }
}
