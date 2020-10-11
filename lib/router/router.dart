import 'package:flutter/material.dart';
import '../ui/pages/pages.dart';
import './routing_constant.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var arguments = settings.arguments;
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case LoginScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case ControlType1ScreenRoute:
      return MaterialPageRoute(
          builder: (context) => ControlType1Screen(
                index: arguments,
              ));
    case ControlType2ScreenRoute:
      return MaterialPageRoute(
          builder: (context) => ControlType2Screen(
                index: arguments,
              ));
    case ChangePasswordScreenRoute:
      return MaterialPageRoute(builder: (context) => ChangePasswordScreen());
    case AddIntersectionScreenRoute:
      return MaterialPageRoute(
          builder: (context) => AddIntersectionScreen(
                intersectionId: arguments,
              ));
    case RenameIntersectionScreenRoute:
      return MaterialPageRoute(
          builder: (context) => RenameIntersectionScreen(
                intersectionId: arguments,
              ));
    default:
      return MaterialPageRoute(builder: (context) => NotFoundScreen());
  }
}
