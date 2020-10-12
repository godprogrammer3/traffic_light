import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traffic_light/router/routing_constant.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:traffic_light/ui/smart_widget/image_display/image_display.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: generateEndDrawer(),
        appBar: AppBar(
          elevation: 10,
          title: Text(
            'Home',
            style: TextStyle(fontSize: 30),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 40,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openEndDrawer();
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scan();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: new Offset(2, 2),
                  blurRadius: 1,
                )
              ], borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: RaisedButton(
                onPressed: () {
                  if (index % 2 == 0) {
                    Navigator.pushNamed(context, ControlType1ScreenRoute,
                        arguments: index);
                  } else {
                    Navigator.pushNamed(context, ControlType2ScreenRoute,
                        arguments: index);
                  }
                },
                color: Color.fromARGB(255, 232, 245, 233),
                child: Row(
                  children: <Widget>[
                    ImageDisplay(
                        imageName: 'traffic_icon.png',
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.1),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'แยก $index',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )));
  }

  Widget generateEndDrawer() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 25),
          height: 100,
          color: Colors.green,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 60,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: new Offset(0, 10),
              blurRadius: 10,
            )
          ]),
          height: 150,
          child: Column(children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.all(15),
              elevation: 0,
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, ChangePasswordScreenRoute);
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.lock,
                    size: 40,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Change password',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(15),
              elevation: 0,
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreenRoute);
              },
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  ImageDisplay(
                    imageName: 'logout.svg',
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }

  Future scan() async {
    try {
      ScanResult scanResult = await BarcodeScanner.scan();
      if (scanResult.rawContent != null && scanResult.rawContent != '') {
        Navigator.pushReplacementNamed(context, AddIntersectionScreenRoute,
            arguments: scanResult.rawContent);
      } else {
        Navigator.pushReplacementNamed(context, HomeScreenRoute);
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Please allow camera permission.'),
        ));
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('PlaformException error was occurred.'),
        ));
      }
    } on FormatException {
      print('user cancel');
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Unknow error was occurred.'),
      ));
    }
  }
}
