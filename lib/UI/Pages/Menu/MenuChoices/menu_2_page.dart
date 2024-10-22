import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/constants.dart';
import 'package:tresto_v002a/UI/Pages/Menu/MenuChoices/menu_information_page.dart';
import 'package:tresto_v002a/UI/Pages/Menu/menu_product_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ColoredBox(
            color: Colors.transparent,
            child: TabBar(
                indicatorColor: AppColor.trestoRed,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabs: [
                  Tab(
                    child: Text(
                      "Information",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColor.trestoRed)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Products",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColor.trestoRed)),
                    ),
                  ),
                  
                ]),
          ),
        ),
        body: const TabBarView(children: [
          MenuInformationPage(),
          MenuProductPage(),
        ]),
      ),
    );
  }
}
