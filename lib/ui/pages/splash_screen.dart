import 'dart:async';

import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';
import '../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(seconds: 2), onFinished);
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void onFinished(){
    Navigator.pushReplacementNamed(context, LoginScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Traffic Light",style: TextStyle(color: Colors.white,fontSize: 50),),
            ImageDisplay(imageName: 'traffic_icon.png',
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            )
          ],
        ),),
        
      )
    );
  }
}