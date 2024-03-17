import 'package:flutter/material.dart';
import 'package:tresto_v002a/Globals/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: Container(
            
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16.0),
            color: AppColor.trestoRed,
            child: Text(AppColor.trestoRed.toString())))
      ],
    );
  }
}