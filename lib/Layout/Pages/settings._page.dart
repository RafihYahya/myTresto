import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //var sizeSettings = <double>[8, 1];
  //var toggleSettings = <bool>[true, false, true];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettings>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.format_size,
                      size: 20,
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: AppColor.trestoRed,
                        value: BlocProvider.of<AppSettingsCubit>(context)
                            .state
                            .textSize,
                        onChanged: (newValue) {
                          BlocProvider.of<AppSettingsCubit>(context)
                              .changeSettings(fontSize: newValue);
                        },
                        max: 18,
                        min: 8,
                        divisions: 10,
                        label:
                            "${BlocProvider.of<AppSettingsCubit>(context).state.textSize.toInt()}",
                      ),
                    ),
                    const Icon(
                      Icons.format_size,
                      size: 36,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.apple,
                      size: 20,
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: AppColor.trestoRed,
                        value: BlocProvider.of<AppSettingsCubit>(context)
                            .state
                            .appScale,
                        onChanged: (newValue) {
                          BlocProvider.of<AppSettingsCubit>(context)
                              .changeSettings(appScale: newValue);
                        },
                        max: 2,
                        min: 0.2,
                        divisions: 10,
                        label: BlocProvider.of<AppSettingsCubit>(context)
                            .state
                            .appScale
                            .toStringAsFixed(1),
                      ),
                    ),
                    const Icon(
                      Icons.apple,
                      size: 36,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Allow Notification',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      )),
                    ),
                    Switch(
                        focusColor: AppColor.trestoRed,
                        activeColor: AppColor.trestoRed,
                        value: BlocProvider.of<AppSettingsCubit>(context)
                            .state
                            .isNotificationOn,
                        onChanged: (bool value) {
                          BlocProvider.of<AppSettingsCubit>(context)
                              .changeSettings(notifOn: value);
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 4.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      )),
                    ),
                    Switch(
                        focusColor: AppColor.trestoRed,
                        activeColor: AppColor.trestoRed,
                        value: BlocProvider.of<AppSettingsCubit>(context)
                            .state
                            .isDarkMode,
                        onChanged: (bool value) {
                          BlocProvider.of<AppSettingsCubit>(context)
                              .changeSettings(darkOn: value);
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 4.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remember Login',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      )),
                    ),
                    Switch(
                        focusColor: AppColor.trestoRed,
                        activeColor: AppColor.trestoRed,
                        value: BlocProvider.of<AppSettingsCubit>(context)
                            .state
                            .stayLoggedIn,
                        onChanged: (bool value) {
                          BlocProvider.of<AppSettingsCubit>(context)
                              .changeSettings(remLogin: value);
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Application Main Color',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0,
                          )),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: [
                      ColorChoiceWidget(
                        color: Colors.green,
                        index: state.colorIndex,
                        initialIndex: 0,
                      ),
                      ColorChoiceWidget(
                        color: Colors.blue,
                        index: state.colorIndex,
                        initialIndex: 1,
                      ),
                      ColorChoiceWidget(
                        color: Colors.orange,
                        index: state.colorIndex,
                        initialIndex: 2,
                      ),
                      ColorChoiceWidget(
                        color: Colors.purple,
                        index: state.colorIndex,
                        initialIndex: 3,
                      ),
                      ColorChoiceWidget(
                        color: Colors.pink,
                        index: state.colorIndex,
                        initialIndex: 4,
                      ),
                      ColorChoiceWidget(
                        color: AppColor.trestoRed,
                        index: state.colorIndex,
                        initialIndex: 5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ColorChoiceWidget extends StatelessWidget {
  final int initialIndex;
  final int index;

  final Color color;
  const ColorChoiceWidget(
      {super.key,
      required this.color,
      required this.initialIndex,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AppSettingsCubit>(context)
            .changeSettings(colorIndex: initialIndex);
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color:
                    index == initialIndex ? Colors.black : Colors.transparent),
            color: color,
            borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}
