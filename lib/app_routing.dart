import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/Global/webview_url_consts.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';
import 'package:tresto_v002a/UI/Pages/Orders/order_page.dart';
import 'package:tresto_v002a/UI/Pages/DashBoard/dashboard_page.dart';
import 'package:tresto_v002a/UI/Pages/inappwebview_page.dart';
import 'package:tresto_v002a/UI/Pages/Menu/menu_page.dart';
import 'package:tresto_v002a/UI/Widgets/my_scaffold_widget.dart';

class AppRouting extends StatefulWidget {
  const AppRouting({super.key});

  @override
  State<AppRouting> createState() => _AppRoutingState();
}

class _AppRoutingState extends State<AppRouting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Main Routes For The Apps , The index is used to switch between them in the bottom navigation bar
    List<Widget> routes = [
      const DashBoardPage(),
      const OrderPage(),
      const InAppWebViewPage(
        changeTresto: false,
        url: WebViewUrls.createResto,
        allowRedirect: false,
      ).animate().fade(
          curve: Curves.easeIn,
          duration: const Duration(
              milliseconds:
                  300)), //const MenuCreatePage(), he is Retarded,Trust Me
      const MenuAlternativePage().animate().fade(
          curve: Curves.easeIn, duration: const Duration(milliseconds: 300)),
    ];
    //Bloc builder rebuild the widget when the index changes
    return BlocBuilder<IndexesCubit, AppIndexes>(
      builder: (context, state) {
        return MyScaffold(
          widget: routes[state.index],
        );
      },
    );
  }
}
