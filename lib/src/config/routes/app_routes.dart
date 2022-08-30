

import 'package:flutter/material.dart';
import 'package:jumpapp/src/presentation/screens/home/home_screen.dart';
import 'package:jumpapp/src/presentation/screens/login/login_screen.dart';
import 'package:jumpapp/src/presentation/screens/splash/splash_screen.dart';
import 'package:jumpapp/src/presentation/screens/story_details/story_details_screen.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case SplashScreen.routeName:
        return _materialRoute(const SplashScreen());
      case LoginScreen.routeName:
        return _materialRoute(const LoginScreen());

      case HomeScreen.routeName:
        return _materialRoute(const HomeScreen());

      // case StoryDetailsScreen.routeName:
      //   return _materialRoute(StoryDetailsScreen());


      default:
        return _materialRoute(const SplashScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
