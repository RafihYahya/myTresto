import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/webview_url_consts.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Auth/auth_bloc_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Orders/orders_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/Layout/Widgets/CustomUtils/custom_loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool passwordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<IndexesCubit>().changeIndex(index: 0);
    //context.read<AuthBlocBloc>().add(EmptyToken());
    //context.read<AuthBlocBloc>().add(EmptySession());
    context.read<DashboardBloc>().add(DashboardReset());
    
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.watch<AppStatusBloc>().state.loginStatus ==
        AppStatusLogin.loggedOut) {
      context.read<OrdersBloc>().add(TurnOffStream());
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      // backgroundColor: AppColor.primaryBackgroundColor,

      body: MultiBlocListener(
        listeners: [
          BlocListener<AppStatusBloc, AppStatusState>(
            listener: (context, state) {
              if (state.apiStatus == AppStatusApi.failure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColor.trestoRed,
                    content: Text(
                      'An Error Has Occurred',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    )));
              }
            },
          ),
        ],
        child: SingleChildScrollView(
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
                        Images.logo2,
                        height: 85,
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
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#//$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                      return "ENTER_VALID_EMAIL";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: AppColor.trestoRed,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: AppColor.trestoRed,
                                      ),
                                    ),
                                    fillColor: Colors.red,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                          color: AppColor.trestoRed, width: 1),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Mot De Passe',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  obscureText: !passwordVisible,
                                  controller: passwordController,
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
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    fillColor: Colors.red,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                          color: AppColor.primaryColor,
                                          width: 1),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
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
                                    BlocConsumer<AuthBlocBloc, AuthBlocState>(
                                      listener: (context, state) async {
                                        if (state.status == AuthState.failure) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      AppColor.trestoRed,
                                                  content: Text(
                                                    'An Error Has Occured',
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black)),
                                                  )));
                                        }
                                        if (state.status == AuthState.done) {
                                          headlessViewForLogin(
                                              emailController.text,
                                              passwordController.text);
                                          context.read<AppStatusBloc>().add(
                                              UpdateLoginStatus(
                                                  status:
                                                      AppStatusLogin.loggedIn));
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state.status == AuthState.loading) {
                                          return const CustomLoading(
                                            height: 20,
                                            width: 20,
                                          );
                                        } else {
                                          return ElevatedButton(
                                              onPressed: () async {

                                                context
                                                    .read<AuthBlocBloc>()
                                                    .add(TokenRequest(
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text));

                                                
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    AppColor.trestoRed,
                                                minimumSize:
                                                    const Size(315, 60),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              child: Text(
                                                'Login',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ));
                                        }
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
      ),
    );
  }
}