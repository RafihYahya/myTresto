import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';

class CustomAuthAlert extends StatelessWidget {
  const CustomAuthAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are You Sure ?',
        style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
      ),
      content:
          const Text('Are You Sure You Want To Logout From Your Account ?'),
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Stay',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w600)),
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
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.trestoRed)),
            ))
      ],
    );
  }
}
