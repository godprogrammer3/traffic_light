import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';

import 'app/router.gr.dart' as auto_router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green, accentColor: Colors.green),
      title: 'Traffic light',
      onGenerateRoute: auto_router.Router().onGenerateRoute,
      navigatorKey: locator<DialogService>().navigatorKey,
    );
  }
}
