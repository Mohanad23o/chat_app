import 'package:chat_app_c11/config/routes/routes.dart';
import 'package:chat_app_c11/features/home/presentation/pages/home_screen.dart';
import 'package:chat_app_c11/features/login/presentation/pages/login_screen.dart';
import 'package:chat_app_c11/features/register/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginIn:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No Route Found'),
              ),
              body: const Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
