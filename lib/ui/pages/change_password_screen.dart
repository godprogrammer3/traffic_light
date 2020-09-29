import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreenRoute);
            }),
        title: Text(
          'Change password',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900])),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Old password'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[900])),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'New password'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[900])),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Confirm new password'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(52, 10, 52, 10),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, HomeScreenRoute);
                        },
                        child: Text(
                          'SAVE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.green,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, HomeScreenRoute);
                        },
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
