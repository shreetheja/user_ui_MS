import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:user_ms_ui/src/routing/page_routes.dart';
import 'package:user_ms_ui/src/views/home/home.dart';
import 'package:user_ms_ui/src/views/login/login.dart';
import 'package:user_ms_ui/src/views/signup/sign-up.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(const HomePage(), settings);
    case loginRoute:
      return _getPageRoute(const Login(), settings);
    case signupRoute:
      return _getPageRoute(const SignupPage(), settings);
    default:
      return _getPageRoute(const HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
