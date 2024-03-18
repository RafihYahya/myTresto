import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_settings.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_status.dart';
import 'package:tresto_v002a/LOGIC/Repositories/app_settings_repo.dart';
import 'package:tresto_v002a/LOGIC/Repositories/dashboard_repo.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';
import 'package:tresto_v002a/app_routing.dart';
import 'package:tresto_v002a/UI/Pages/login_page.dart';
import 'package:tresto_v002a/mainobserver.dart';
import 'package:tresto_v002a/mock_data_testing.dart';

void main() async {
  //Observe State Changes For debugging
  Bloc.observer = MainObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    RepositoryProvider(
      create: (context) => AppSettingsRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSettingsCubit(
                AppSettings(
                    isDarkMode: false,
                    appColor: AppColor(),
                    textSize: 12,
                    appScale: 1.0,
                    isNotificationOn: true,
                    stayLoggedIn: false),
                RepositoryProvider.of<AppSettingsRepository>(context)),
          ),
          BlocProvider(
            create: (context) => AppStatusCubit(),
          ),
          BlocProvider(
              create: (context) => IndexesCubit(AppIndexes(
                    index: 0,
                    restoIndex: 0,
                  ))),
        ],
        child: RepositoryProvider(
          create: (context) => DashBoardRepository(),
          child: BlocProvider(
            create: (context) => DashBoardCubit(
              DashBoardState(
                  dashboardData: dashboardfull2,
                  dashBoardStateApiEnum: DashBoardStateApiEnum.nothing,
                  authToken: ''
                  ),
              RepositoryProvider.of<DashBoardRepository>(context),
            ),
            child: const MainApp(),
          ),
        ),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    //rebuild entire App when Settings Change
    return BlocBuilder<AppSettingsCubit, AppSettings>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tresto',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: Scaffold(
            //Rebuild the widget when the Status changes
            body: BlocBuilder<AppStatusCubit, AppStatus>(
              builder: (context, state) {
                return state.loginStatus == LoginStatus.loggedIn
                    ? const LoginPage() // use TestPage here for testing
                    : const AppRouting();
              },
            ),
          ),
        );
      },
    );
  }
}
