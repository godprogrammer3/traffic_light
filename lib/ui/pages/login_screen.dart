import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';
import 'package:traffic_light/ui/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                          child: Form(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.account_circle),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[900])),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Email'),
                          ),
                        )
                      ],
                    ),
                     Container(
                       margin: EdgeInsets.only(top:30),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                              obscureText: isPasswordHide,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(icon:Icon((isPasswordHide)?Icons.visibility:Icons.visibility_off), onPressed: () {  
                                  setState((){
                                    isPasswordHide = !isPasswordHide;
                                  });
                                },),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[900])),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: 'Password'),
                            ),
                          )
                        ],
                    ),
                     ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  onPressed: (){
                     Navigator.pushReplacementNamed(context, HomeScreenRoute);
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
