import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'You Are Going To Leave',
        style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
      ),
      content: const Text(
          'The Action You Are About To Take shall Ruin The Human Race, ARe you Sure You wanna do this ?'),
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
