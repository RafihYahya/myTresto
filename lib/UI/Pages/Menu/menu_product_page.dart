import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tresto_v002a/UI/Widgets/MenuPageComps/product_custom_menu_tile.dart';

class MenuProductPage extends StatelessWidget {
  const MenuProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 28.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 8.0,
              ),
              FaIcon(
                FontAwesomeIcons.xmark,
                size: 20.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              FaIcon(
                FontAwesomeIcons.pen,
                size: 20.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              
            ],
          ),
          SizedBox(
            height: 28.0,
          ),
            ProductMenuCustomRow(),
            SizedBox(height: 12.0,),
            ProductMenuCustomRow(),
        ],
      ),
    );
  }
}

class ProductMenuCustomRow extends StatelessWidget {
  const ProductMenuCustomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       SizedBox(width: 24.0,),
       Expanded(child: ProductCustomMenuTile()),
       SizedBox(width: 12.0,),
       Expanded(child: ProductCustomMenuTile()),
       SizedBox(width: 24.0,),
     ],
              );
  }
}
