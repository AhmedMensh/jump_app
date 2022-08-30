

import 'package:flutter/material.dart';
import 'package:jumpapp/src/presentation/screens/home/home_screen.dart';
import 'package:jumpapp/src/presentation/screens/splash/splash_screen.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case SplashScreen.routeName:
        return _materialRoute(const SplashScreen());

      case HomeScreen.routeName:
        return _materialRoute(const HomeScreen());


      default:
        return _materialRoute(const SplashScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
