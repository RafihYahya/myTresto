import 'package:flutter/material.dart';

class CustomOrdersTileLoading extends StatelessWidget {
  const CustomOrdersTileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey[300]!),
            color: Colors.white),
        height: 160,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: null
            
             
            
          ),
        ),
      
    );
  }
}
