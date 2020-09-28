import 'package:flutter/material.dart';
import '../ui/pages/pages.dart';
import './routing_constant.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case LoginScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    default:
      return MaterialPageRoute(builder: (context) => NotFoundScreen());
  }
}