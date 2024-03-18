import 'package:flutter/material.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/UI/Widgets/AppBars/bottom_nav_bar.dart';
import 'package:tresto_v002a/UI/Widgets/AppBars/top_app_bar.dart';

class MyScaffold extends StatelessWidget {
  final Widget widget;
  const MyScaffold({
    super.key,
    required this.widget
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColor.mainColor, //const Color(0xFFF3F4F6),
        appBar: const PreferredSize(
            
            preferredSize:  Size.fromHeight(50.0),
            child: AlternativeCNavBar(
              showresto: true,
            )),
        bottomNavigationBar: const BotNavBarAlternative(),
        body:widget);
  }
}
