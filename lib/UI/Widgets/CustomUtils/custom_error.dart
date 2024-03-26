import 'package:flutter/material.dart';

class CustomError extends StatefulWidget {
  const CustomError({super.key});

  @override
  State<CustomError> createState() => _CustomErrorState();
}

class _CustomErrorState extends State<CustomError> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('data')));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: null);
  }
}
