import 'package:algoriza_task1/presentation_layer/screens/login_screen.dart';
import 'package:algoriza_task1/presentation_layer/screens/on_boarding/on_boarding_screen.dart';
import 'package:algoriza_task1/presentation_layer/screens/register_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();
  static RouteGenerator routeGenerator = RouteGenerator._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
    }

    return null;
  }
}
