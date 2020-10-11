import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';

class RenameIntersectionScreen extends StatefulWidget {
  final int intersectionId;
  RenameIntersectionScreen({Key key, @required this.intersectionId})
      : super(key: key);

  @override
  _RenameIntersectionScreenState createState() =>
      _RenameIntersectionScreenState(intersectionId: intersectionId);
}

class _RenameIntersectionScreenState extends State<RenameIntersectionScreen> {
  final int intersectionId;

  _RenameIntersectionScreenState({@required this.intersectionId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Rename intersection',
          style: TextStyle(color: Colors.white, fontSize: 25),
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
                              hintText: 'แยก ' + intersectionId.toString()),
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
                          Navigator.pop(context);
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
                          Navigator.pop(context);
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
