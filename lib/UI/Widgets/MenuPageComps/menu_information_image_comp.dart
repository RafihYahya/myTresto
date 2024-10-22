import 'package:flutter/material.dart';
import 'package:tresto_v002a/Globals/constants.dart';

class InformationImageComp extends StatelessWidget {
  const InformationImageComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
          color: AppColor.trestoRed,
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(Images.restoImgUrl))),
    );
  }
}
