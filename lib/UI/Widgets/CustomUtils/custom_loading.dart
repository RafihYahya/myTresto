import 'package:flutter/material.dart';
import 'package:tresto_v002a/Global/constants.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColor.trestoRed,
        ),
      ),
    );
  }
}
