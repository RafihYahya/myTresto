import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/webview_url_consts.dart';
import 'package:tresto_v002a/Layout/Pages/inappwebview_page.dart';
import 'package:tresto_v002a/Layout/Pages/settings._page.dart';
import 'package:tresto_v002a/Layout/Widgets/menu_custom_tile.dart';

class MenuAlternativePage extends StatelessWidget {
  const MenuAlternativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          /* AlternativeMenuCustomTile(
              showtitle: false,
              title: 'Profile',
              widget: MenuPage(),
              myicon: HeroIcon(
                HeroIcons.userCircle,
                style: HeroIconStyle.outline,
                size: 23,
                color: Colors.grey,
              )), */
          /* Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ), */
          /* AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Tableau De Bord',
            widget: WebViewPage(
              ,
              url: WebViewUrls.home,
            ),
            myicon: HeroIcon(
              HeroIcons.home,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ), */
          /* AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Commandes',
            widget: Placeholder(),
            myicon: HeroIcon(
              HeroIcons.shoppingBag,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ), */
          /* Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ), */
          /* const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Test',
            widget: TestPage(),
            myicon: HeroIcon(
              HeroIcons.square2Stack,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ), */
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Tables',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.tables,
              allowRedirect: true,
            ),
            myicon: HeroIcon(
              HeroIcons.square2Stack,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Livreurs',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.drivers,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.truck,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Le Personnel',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.staff,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.userGroup,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Clients',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.clients,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.users,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Newsletter',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.newsletter,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.megaphone,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Rapport Des Ventes',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.analytics,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.chartBar,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Vues Statistiques',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.marketing,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.chartPie,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          const AlternativeMenuCustomTile(
            showtitle: false,
            title: 'Restaurant',
            widget: InAppWebViewPage(
              changeTresto: true,
              url: WebViewUrls.settings,
              allowRedirect: false,
            ),
            myicon: HeroIcon(
              HeroIcons.buildingStorefront,
              style: HeroIconStyle.outline,
              size: 23,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          AlternativeMenuCustomTile(
              showtitle: false,
              title: 'Contactez-nous',
              widget: const InAppWebViewPage(
                changeTresto: true,
                url: 'https://youtube.com',
                allowRedirect: false,
              ).animate().fadeIn(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1200)),
              myicon: const Icon(
                Icons.help_outline,
                size: 23,
                color: Colors.grey,
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          AlternativeMenuCustomTile(
              showtitle: false,
              title: 'App Settings',
              widget:const SettingsPage().animate().fadeIn(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1200)),
              myicon: const Icon(
                Icons.settings,
                size: 23,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
