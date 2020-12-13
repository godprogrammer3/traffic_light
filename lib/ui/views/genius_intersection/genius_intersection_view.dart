import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/datamodel/intersection.dart';

import 'genius_intersection_viewmodel.dart';

class GeniusIntersectionView extends HookWidget {
  const GeniusIntersectionView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Intersection intersection = ModalRoute.of(context).settings.arguments;
    return ViewModelBuilder<GeniusIntersectionViewModel>.reactive(
        onModelReady: (model) {
          model.setIntersection(intersection);
        },
        fireOnModelReadyOnce: true,
        builder: (context, model, child) => WillPopScope(
            onWillPop: () async {
              model.goToHomePage();
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 10,
                title: Row(
                  children: <Widget>[
                    Text(
                      model.intersection.name,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    onPressed: () {
                      model.gotoRenameIntersectionPage();
                    },
                  )
                ],
              ),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        generateButton(model,
                            bottomText: 'Auto', mode: Mode.Auto, callBack: () {
                          model.updateIntesection(value: {'mode': 'Auto'});
                        }),
                        generateButton(model,
                            bottomText: 'Manual',
                            mode: Mode.Manual, callBack: () {
                          model.updateIntesection(value: {'mode': 'Manual'});
                        }),
                        generateButton(model,
                            bottomText: 'Flashing',
                            mode: Mode.Flashing, callBack: () {
                          model.updateIntesection(value: {'mode': 'Flashing'});
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        generateButton(model,
                            bottomText: 'All Red',
                            mode: Mode.AllRed, callBack: () {
                          model.updateIntesection(value: {'mode': 'AllRed'});
                        }),
                        generateButton(model,
                            bottomText: 'Actuated',
                            mode: Mode.Actuated, callBack: () {
                          model.updateIntesection(value: {'mode': 'Actuated'});
                        }),
                        generateButton(model,
                            bottomText: 'SignalCh..',
                            mode: Mode.SignalChange, callBack: () {
                          model.updateIntesection(
                              value: {'mode': 'SignalChange'});
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        generateButton(model, insideText: '1', callBack: () {
                          model.updateIntesection(value: {'currentButton': 1});
                        }),
                        generateButton(model, insideText: '2', callBack: () {
                          model.updateIntesection(value: {'currentButton': 2});
                        }),
                        generateButton(model, insideText: '3', callBack: () {
                          model.updateIntesection(value: {'currentButton': 3});
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        generateButton(model, insideText: '4', callBack: () {
                          model.updateIntesection(value: {'currentButton': 4});
                        }),
                        generateButton(model, insideText: '5', callBack: () {
                          model.updateIntesection(value: {'currentButton': 5});
                        }),
                        generateButton(model, insideText: '6', callBack: () {
                          model.updateIntesection(value: {'currentButton': 6});
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        generateButton(model, insideText: '7', callBack: () {
                          model.updateIntesection(value: {'currentButton': 7});
                        }),
                        generateButton(model, insideText: '8', callBack: () {
                          model.updateIntesection(value: {'currentButton': 8});
                        }),
                      ],
                    ),
                  ]),
            )),
        viewModelBuilder: () => GeniusIntersectionViewModel());
  }

  Widget generateButton(
    GeniusIntersectionViewModel model, {
    String bottomText,
    String insideText,
    Function callBack,
    Mode mode,
  }) {
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
                ? (model.intersection.mode == mode)
                    ? Colors.green
                    : Colors.grey[300]
                : (model.intersection.currentButton.toString() == insideText)
                    ? Colors.green
                    : Colors.grey[300],
            onPressed: (insideText == null)
                ? callBack
                : (model.intersection.mode != Mode.Manual)
                    ? null
                    : callBack,
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
