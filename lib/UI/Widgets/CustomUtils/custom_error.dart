import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Auth/auth_bloc_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Orders/orders_bloc.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something Wrong Has Occured')));
          },
        ),
        BlocListener<OrdersBloc, OrdersState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something Wrong Has Occured')));
          },
        ),
        BlocListener<AuthBlocBloc, AuthBlocState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something Wrong Has Occured')));
          },
        ),
      ],
      child: const SizedBox(),
    );
  }
}
