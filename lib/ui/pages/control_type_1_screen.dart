import 'package:flutter/material.dart';
import 'package:traffic_light/router/routing_constant.dart';

enum Mode { Auto, Manual, Flashing, AllRed, Actuated, SignalChange }

class ControlType1Screen extends StatefulWidget {
  final int index;
  const ControlType1Screen({Key key, @required this.index}) : super(key: key);
  @override
  _ControlType1ScreenState createState() =>
      _ControlType1ScreenState(index: index);
}

class _ControlType1ScreenState extends State<ControlType1Screen> {
  final int index;
  Mode _mode = Mode.Auto;
  String _phase = '1';
  _ControlType1ScreenState({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Row(
          children: <Widget>[
            Text(
              'แยก $index',
              style: TextStyle(fontSize: 30),
            ),
            Spacer(),
            Text('Plan 8', style: TextStyle(fontSize: 25))
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, RenameIntersectionScreenRoute,
                  arguments: index);
            },
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    '9999',
                    style: TextStyle(fontSize: 80),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                generateButton(
                    bottomText: 'Auto',
                    mode: Mode.Auto,
                    callBack: () {
                      setState(() {
                        _mode = Mode.Auto;
                      });
                    }),
                generateButton(
                    bottomText: 'Manual',
                    mode: Mode.Manual,
                    callBack: () {
                      setState(() {
                        _mode = Mode.Manual;
                      });
                    }),
                generateButton(
                    bottomText: 'Flashing',
                    mode: Mode.Flashing,
                    callBack: () {
                      setState(() {
                        _mode = Mode.Flashing;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                generateButton(
                    bottomText: 'All Red',
                    mode: Mode.AllRed,
                    callBack: () {
                      setState(() {
                        _mode = Mode.AllRed;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                generateButton(
                    insideText: '1',
                    callBack: () {
                      setState(() {
                        _phase = '1';
                      });
                    }),
                generateButton(
                    insideText: '2',
                    callBack: () {
                      setState(() {
                        _phase = '2';
                      });
                    }),
                generateButton(
                    insideText: '3',
                    callBack: () {
                      setState(() {
                        _phase = '3';
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                generateButton(
                    insideText: '4',
                    callBack: () {
                      setState(() {
                        _phase = '4';
                      });
                    }),
                generateButton(
                    insideText: '5',
                    callBack: () {
                      setState(() {
                        _phase = '5';
                      });
                    }),
                generateButton(
                    insideText: '6',
                    callBack: () {
                      setState(() {
                        _phase = '6';
                      });
                    })
              ],
            ),
          ]),
    );
  }

  Widget generateButton(
      {String bottomText, String insideText, Function callBack, Mode mode}) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: 1.0, style: BorderStyle.solid),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            color: (insideText == null)
                ? (_mode == mode) ? Colors.green : Colors.grey[300]
                : (_phase == insideText) ? Colors.green : Colors.grey[300],
            onPressed: (insideText == null)
                ? callBack
                : (_mode != Mode.Manual) ? null : callBack,
            child: SizedBox(
              width: 80,
              height: 80,
              child: (insideText != null)
                  ? Center(
                      child: Text(
                        insideText,
                        style: TextStyle(fontSize: 40),
                      ),
                    )
                  : Container(),
            ),
          ),
          (bottomText != null)
              ? Text(
                  bottomText,
                  style: TextStyle(fontSize: 20),
                )
              : Container()
        ],
      ),
    );
  }
}
