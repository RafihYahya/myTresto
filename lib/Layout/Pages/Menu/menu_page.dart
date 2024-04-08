
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/Global/webview_url_consts.dart';
import 'package:tresto_v002a/Layout/Pages/inappwebview_page.dart';
import 'package:tresto_v002a/Layout/Widgets/CustomUtils/custom_alert_auth_dialogue.dart';
import 'package:tresto_v002a/Layout/Widgets/menu_custom_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuAlternativePage extends StatelessWidget {
  const MenuAlternativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MediaQuery.of(context).size.width > 1080
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
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
          SizedBox(
            height: 40,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.greenAccent,
                    content: Text(
                      'Redirecting To WhatsApp ...',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                    )));
                await launchUrl(Uri.parse(
                    'https://api.whatsapp.com/send?phone=+212708900709&text=Bonjour'));
                logger.i('miaw');
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  const Icon(
                    Icons.help_outline,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Contact Us',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12, color: Colors.black)),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const CustomAuthAlert());
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  const HeroIcon(
                    HeroIcons.arrowLeftEndOnRectangle,
                    size: 24.0,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          /*  AlternativeMenuCustomTile(
              showtitle: false,
              title: 'App Settings',
              widget:const SettingsPage().animate().fadeIn(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1200)),
              myicon: const Icon(
                Icons.settings,
                size: 23,
                color: Colors.grey,
              )), */
        ],
      ),
    );
  }
}
