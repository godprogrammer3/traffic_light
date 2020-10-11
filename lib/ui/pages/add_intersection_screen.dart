import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';

class AddIntersectionScreen extends StatefulWidget {
  final String intersectionId;
  AddIntersectionScreen({Key key, @required this.intersectionId})
      : super(key: key);

  @override
  _AddIntersectionScreenState createState() => _AddIntersectionScreenState();
}

class _AddIntersectionScreenState extends State<AddIntersectionScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, HomeScreenRoute);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreenRoute);
              }),
          title: Text(
            'Add intersection',
            style: TextStyle(color: Colors.white, fontSize: 30),
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
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[900])),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Name'),
                          ),
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
      ),
    );
  }
}
