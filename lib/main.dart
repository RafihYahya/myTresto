import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Dashboard/dashboard_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/Orders/orders_bloc.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_indexes_cubit.dart';
import 'package:tresto_v002a/LOGIC/Cubits/app_settings.cubit.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_settings.dart';
import 'package:tresto_v002a/LOGIC/Repos/app_settings_repo.dart';
import 'package:tresto_v002a/LOGIC/Repos/app_status_repo.dart';
import 'package:tresto_v002a/LOGIC/Repos/dashboard_repo.dart';
import 'package:tresto_v002a/LOGIC/Models/Global/app_indexes_data.dart';
import 'package:tresto_v002a/UI/Pages/login_page.dart';
import 'package:tresto_v002a/app_routing.dart';
import 'package:tresto_v002a/mainobserver.dart';

void main() async {
  //Observe State Changes For debugging
  Bloc.observer = MainObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AppSettingsRepository()),
        RepositoryProvider(create: (context) => AppStatusRepository()),
        RepositoryProvider(create: (context) => DashBoardRepository()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => AppSettingsCubit(const AppSettings.initial(),
                context.read<AppSettingsRepository>())),
        BlocProvider(
            create: (context) =>
                AppStatusBloc(context.read<AppStatusRepository>())),
        BlocProvider(
            create: (context) =>
                DashboardBloc(dashBoard: context.read<DashBoardRepository>())),
        BlocProvider(create: (context) => OrdersBloc()),
        BlocProvider(create: (context) => IndexesCubit(AppIndexes.initial())),
      ], child: const MainApp())));
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
              body: MultiBlocListener(
            listeners: [
              BlocListener<DashboardBloc, DashboardState>(
                  listener: (context, state) => context
                      .read<IndexesCubit>()
                      .changeMaxRestoNum(
                          maxRestoNumber: context
                              .read<DashboardBloc>()
                              .restoListCollector()
                              .length)),
              BlocListener<OrdersBloc, OrdersState>(
                listener: (context, state) {
                  BlocProvider.of<IndexesCubit>(context).changeMaxRestoNum(
                      maxRestoNumber: context
                          .read<OrdersBloc>()
                          .restoListCollector()
                          .length);
                },
              ),
            ],
            child: BlocBuilder<AppStatusBloc, AppStatusState>(
                builder: (context, state) {
              return switch (state.loginStatus) {
                AppStatusLogin.loggedIn => const AppRouting(),
                AppStatusLogin.loggedOut => const LoginPage()
              };
            }),
          )),
        );
      },
    );
  }
}
