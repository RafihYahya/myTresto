import 'package:flutter/material.dart';
import 'package:tresto_v002a/UI/Widgets/MenuPageComps/create_product_comp.dart';
import 'package:tresto_v002a/UI/Widgets/MenuPageComps/create_resto_comp.dart';
import 'package:tresto_v002a/UI/Widgets/MenuPageComps/creation_tab_menu.dart';

class MenuCreatePage extends StatefulWidget {
  const MenuCreatePage({super.key});

  @override
  State<MenuCreatePage> createState() => _MenuCreatePageState();
}

class _MenuCreatePageState extends State<MenuCreatePage> {
    int creationTabIndex = 0;
    void updateCreationTabIndex(int i) {
      if (i < 2 && i >= 0) {
        setState(() {
          creationTabIndex = i;
        });
      }
    }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CreationTabsMenu(updateIndex: updateCreationTabIndex,index: creationTabIndex,),
            ),
            creationTabIndex == 0
                ? const CreateRestoComp()
                : const CreateProductComp(),
          ],
        ),
      ),
    );
  }
}
