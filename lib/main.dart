import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';
import './router/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Traffic light',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: router.generateRoute,
        initialRoute: SplashScreenRoute
    );
  }
}
