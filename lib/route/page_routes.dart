import 'package:flutter/material.dart';
import 'package:money_controller/features/home/home_screen.dart';
import 'package:money_controller/features/login/login_screen.dart';
import 'package:money_controller/features/splash/splash_screen.dart';
import 'package:money_controller/models/navigator_agruments/arguments_screen_model.dart';

class Routes {

  Routes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static String _current = splash;

  static get current => _current;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _current = settings.name ?? splash;

    final arguments = settings.arguments != null && settings.arguments is ArgumentsScreenModel
        ? settings.arguments as ArgumentsScreenModel
        : ArgumentsScreenModel(title: "unknowns");

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: const RouteSettings(name: splash),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: const RouteSettings(name: home),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: const RouteSettings(name: login),
        );
      default:
        return MaterialPageRoute(settings: const RouteSettings(name: splash), builder: (_) => const SplashScreen());
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings? routeSettings;
  final bool reverse;

  SlideRightRoute({required this.widget, this.routeSettings, this.reverse = false})
      : super(
          settings: routeSettings,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(reverse ? -1.0 : 1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
