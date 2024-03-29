import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Orders/orders_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'An Error Has Occurred',
        style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
      ),
      content: const Text(
          'Something went wrong. Please check your internet connection and try again. Or you can logout from your account.'),
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              context.read<DashboardBloc>().add(DashboardUpdate());
              context.read<OrdersBloc>().add(GetOrders());
              BlocProvider.of<OrdersBloc>(context).add(NewOrder(
                  color: AppColor.colorIndexTrestoList[
                      context.watch<AppSettingsCubit>().state.colorIndex]));
            },
            child: Text(
              'Reload',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 14,
              )),
            )),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              context
                  .read<AppStatusBloc>()
                  .add(UpdateLoginStatus(status: AppStatusLogin.loggedOut));
            },
            child: Text(
              'Leave',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.trestoRed)),
            ))
      ],
    );
  }
}
