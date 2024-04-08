import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Orders/orders_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/orders_model.dart';
import 'package:tresto_v002a/Layout/Pages/Orders/order_details_page.dart';

class CustomOrdersTile extends StatelessWidget {
  final OrderData? orders;
  const CustomOrdersTile({
    required this.orders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          splashColor: AppColor.trestoRed025,
          highlightColor: AppColor.trestoRed025,
          onTap: () {
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1);
                      const end = Offset.zero;
                      final curve = CurveTween(curve: Curves.easeInOut);
                      final tween = Tween(begin: begin, end: end).chain(curve);
                      final offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        BlocProvider.value(
                            value: BlocProvider.of<OrdersBloc>(context),
                            child: BlocProvider.value(
                              value: BlocProvider.of<AppSettingsCubit>(context),
                              child: const OrderDetailsPage(),
                            ))),
              );
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey[300]!),
            ),
            height: 160,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const HeroIcon(
                            HeroIcons.shoppingBag,
                            style: HeroIconStyle.outline,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Order ID:',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black38)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            orders?.orderId == null
                                ? 'No Data'
                                : orders!.orderId.toString(),
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black)),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightGreen[50]),
                            child: Text(
                              orders?.status == null
                                  ? 'No Data'
                                  : orders!.status
                                      .toString()
                                      .substring('OrderStatus'.length + 1,
                                          orders!.status.toString().length)
                                      .toUpperCase(),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.green)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                        child: Text(
                          'Customer:',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black38)),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            orders?.customerName == null
                                ? 'Error'
                                : orders!.customerName!,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.colorIndexTrestoList25[context
                                    .watch<AppSettingsCubit>()
                                    .state
                                    .colorIndex]),
                            child: Text(orders?.amount == null
                                ? 'Error'
                                : orders!.amount.toString()),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Amount:',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black38)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        orders?.amount == null
                            ? 'Error'
                            : orders!.amount.toString(),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Element +${(orders?.amount == null ? 0 : orders!.amount!) < 2 ? "" : "s"}",
                        style: TextStyle(
                            color: AppColor.colorIndexTrestoList[context
                                .watch<AppSettingsCubit>()
                                .state
                                .colorIndex]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                        child: Text(
                          'Date:',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black38)),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        orders?.date == null
                            ? 'Error'
                            : orders!.date.toString(),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: AppColor.colorIndexTrestoList[context
                                    .watch<AppSettingsCubit>()
                                    .state
                                    .colorIndex])),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.keyboard_double_arrow_right,
                        size: 20,
                        color: AppColor.colorIndexTrestoList[
                            context.watch<AppSettingsCubit>().state.colorIndex],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
