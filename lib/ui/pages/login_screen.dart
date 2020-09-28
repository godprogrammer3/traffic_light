import 'package:flutter/material.dart';
import 'package:traffic_light/ui/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                "Traffic Light",
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              ImageDisplay(
                imageName: 'traffic_icon.png',
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 50,
                  child: TextField(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 50,
                  child: TextField(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                
                  onPressed: ()=>{},
                  child: Text('LOGIN',style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
