import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Globals/webview_url_consts.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_status_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/dashboard_state.dart';
import 'package:tresto_v002a/Globals/constants.dart';
import 'package:tresto_v002a/app_routing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      // backgroundColor: AppColor.primaryBackgroundColor,

      body: SingleChildScrollView(
        child: Transform.scale(
          scale: 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Images.imgLink,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            // print(authController.loader);
                          },
                          child: Text('Bienvenue',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                              )),
                        ),
                      ),
                      Form(
                        // key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'E-mail',
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                // controller: authController.emailController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                    return "ENTER_VALID_EMAIL";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.trestoRed,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.trestoRed,
                                    ),
                                  ),
                                  fillColor: Colors.red,
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: AppColor.trestoRed, width: 1),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColor.dividerColor),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Mot De Passe',
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                obscureText: passwordVisible,
                                // controller: authController.passwordController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"^.{6,}").hasMatch(value)) {
                                    return "PASSWORD_MUST";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  fillColor: Colors.red,
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor, width: 1),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColor.dividerColor),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppColor.gray,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          passwordVisible = !passwordVisible;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  BlocBuilder<DashBoardCubit, DashBoardState>(
                                    builder: (context2, state) {
                                      return ElevatedButton(
                                        onPressed: () async {
                                           
                                              await BlocProvider.of<DashBoardCubit>(
                                                  context)
                                              .getToken(); 
                                              await headlessViewForLogin(
                                              'test2@gmail.com',
                                              'test2@gmail.com');
                                          
                                          if (context.mounted) {
                                            if (state.dashBoardStateApiEnum ==
                                                DashBoardStateApiEnum.success) {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (_) =>
                                                    BlocProvider.value(
                                                        value: BlocProvider.of<
                                                                AppStatusCubit>(
                                                            context),
                                                        child:
                                                            BlocProvider.value(
                                                                value: BlocProvider
                                                                    .of<IndexesCubit>(
                                                                        context),
                                                                child:
                                                                    BlocProvider
                                                                        .value(
                                                                  value: BlocProvider
                                                                      .of<DashBoardCubit>(
                                                                          context),
                                                                  child:
                                                                      const AppRouting(),
                                                                ))),
                                              ));
                                            }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: AppColor.trestoRed,
                                          minimumSize: const Size(292, 52),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                          ),
                                        ),
                                        child: 
                                        state.dashBoardStateApiEnum != DashBoardStateApiEnum.loading ?
                                        Text(
                                          'Se connecter'.toUpperCase(),
                                          style: GoogleFonts.rubik(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                        ) : CircularProgressIndicator() ,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
