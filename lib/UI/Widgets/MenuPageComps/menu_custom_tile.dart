
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';

class AlternativeMenuCustomTile extends StatelessWidget {
  final String title;
  final Widget widget;
  final Widget myicon;
  final bool showtitle;

  const AlternativeMenuCustomTile(
      {super.key,
      required this.title,
      required this.widget,
      required this.myicon,
      required this.showtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.transparent),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => BlocProvider.value(
              value: BlocProvider.of<IndexesCubit>(ctx),
                  child: Scaffold(
                      appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(50.0),
                        child: AppBar()),
                      body: widget),
                ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20.0,
            ),
            myicon,
            const SizedBox(
              width: 8.0,
            ),
            SizedBox(
              width: 250,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
