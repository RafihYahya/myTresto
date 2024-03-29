import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tresto_v002a/Layout/Widgets/OrderComp/custom_order_tile_loading.dart';

class CustomTileLoadingListView extends StatelessWidget {
  const CustomTileLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const CustomOrdersTileLoading());
  }
}
