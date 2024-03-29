import 'package:flutter/material.dart';
import 'package:tresto_v002a/Global/constants.dart';

class CustomLoading extends StatelessWidget {
  final double height;
  final double width;
  const CustomLoading({super.key, required this.height , required this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColor.trestoRed,
        ),
      ),
    );
  }
}
