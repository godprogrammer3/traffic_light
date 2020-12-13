// import 'package:flutter/material.dart';
// import 'package:traffic_light/router/routing_constant.dart';
// import 'control_type_1_screen.dart';

// class ControlType2Screen extends StatefulWidget {
//   final int index;
//   const ControlType2Screen({Key key, @required this.index}) : super(key: key);
//   @override
//   _ControlType2ScreenState createState() =>
//       _ControlType2ScreenState(index: index);
// }

// class _ControlType2ScreenState extends State<ControlType2Screen> {
//   final int index;
//   Mode _mode = Mode.Auto;
//   String _phase = '1';
//   _ControlType2ScreenState({@required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 10,
//         title: Row(
//           children: <Widget>[
//             Text(
//               'แยก $index',
//               style: TextStyle(fontSize: 30),
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.settings,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.pushNamed(context, RenameIntersectionScreenRoute,
//                   arguments: index);
//             },
//           )
//         ],
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 generateButton(
//                     bottomText: 'Auto',
//                     mode: Mode.Auto,
//                     callBack: () {
//                       setState(() {
//                         _mode = Mode.Auto;
//                       });
//                     }),
//                 generateButton(
//                     bottomText: 'Manual',
//                     mode: Mode.Manual,
//                     callBack: () {
//                       setState(() {
//                         _mode = Mode.Manual;
//                       });
//                     }),
//                 generateButton(
//                     bottomText: 'Flashing',
//                     mode: Mode.Flashing,
//                     callBack: () {
//                       setState(() {
//                         _mode = Mode.Flashing;
//                       });
//                     })
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 generateButton(
//                     bottomText: 'All Red',
//                     mode: Mode.AllRed,
//                     callBack: () {
//                       setState(() {
//                         _mode = Mode.AllRed;
//                       });
//                     }),
//                 generateButton(
//                     bottomText: 'Actuated',
//                     mode: Mode.Actuated,
//                     callBack: () {
//                       setState(() {
//                         _mode = Mode.Actuated;
//                       });
//                     }),
//                 generateButton(
//                     bottomText: 'SignalCh..',
//                     mode: Mode.SignalChange,
//                     callBack: () {
//                       setState(() {
//                         _mode = Mode.SignalChange;
//                       });
//                     })
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 generateButton(
//                     insideText: '1',
//                     callBack: () {
//                       setState(() {
//                         _phase = '1';
//                       });
//                     }),
//                 generateButton(
//                     insideText: '2',
//                     callBack: () {
//                       setState(() {
//                         _phase = '2';
//                       });
//                     }),
//                 generateButton(
//                     insideText: '3',
//                     callBack: () {
//                       setState(() {
//                         _phase = '3';
//                       });
//                     })
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 generateButton(
//                     insideText: '4',
//                     callBack: () {
//                       setState(() {
//                         _phase = '4';
//                       });
//                     }),
//                 generateButton(
//                     insideText: '5',
//                     callBack: () {
//                       setState(() {
//                         _phase = '5';
//                       });
//                     }),
//                 generateButton(
//                     insideText: '6',
//                     callBack: () {
//                       setState(() {
//                         _phase = '6';
//                       });
//                     })
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 generateButton(
//                     insideText: '7',
//                     callBack: () {
//                       setState(() {
//                         _phase = '7';
//                       });
//                     }),
//                 generateButton(
//                     insideText: '8',
//                     callBack: () {
//                       setState(() {
//                         _phase = '8';
//                       });
//                     }),
//               ],
//             ),
//           ]),
//     );
//   }

//   Widget generateButton(
//       {String bottomText, String insideText, Function callBack, Mode mode}) {
//     return Container(
//       padding: EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         border: Border.all(
//             color: Colors.black, width: 1.0, style: BorderStyle.solid),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           RaisedButton(
//             padding: EdgeInsets.all(0),
//             shape: CircleBorder(),
//             color: (insideText == null)
//                 ? (_mode == mode) ? Colors.green : Colors.grey[300]
//                 : (_phase == insideText) ? Colors.green : Colors.grey[300],
//             onPressed: (insideText == null)
//                 ? callBack
//                 : (_mode != Mode.Manual) ? null : callBack,
//             child: SizedBox(
//               width: 80,
//               height: 80,
//               child: (insideText != null)
//                   ? Center(
//                       child: Text(
//                         insideText,
//                         style: TextStyle(fontSize: 40),
//                       ),
//                     )
//                   : Container(),
//             ),
//           ),
//           (bottomText != null)
//               ? Text(
//                   bottomText,
//                   style: TextStyle(fontSize: 20),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }
// }
