import 'package:flutter/material.dart';
import 'package:module_commons/helpers/driver_rating_routes.dart';
import 'package:module_external_dependencies/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(DriverRatingRoutes.splash);

    return MaterialApp.router(
        title: 'Avaliação de Motoristas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
            bottomNavigationBarTheme:
                const BottomNavigationBarThemeData(backgroundColor: Colors.transparent, elevation: 0),
            bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent)),
        routerConfig: Modular.routerConfig); //added by extension
  }
}
