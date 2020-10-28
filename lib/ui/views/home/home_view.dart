import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/ui/smart_widget/image_display/image_display.dart';

import 'home_viewmodel.dart';

class HomeView extends HookWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model) => model.getIntersections(),
        builder: (context, model, child) => Scaffold(
            key: model.scaffoldKey,
            endDrawer: endDrawer(),
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
                      model.openEndDrawer();
                    })
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.addIntersection();
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
            body: LoadingOverlay(
              isLoading: model.isBusy,
              child: Center(
                  child: ListView.builder(
                itemCount: model.intersections.length,
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
                          print('Control type 1 route');
                        } else {
                          print('Control type 2 route');
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
                              model.intersections[index].name,
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
            )),
        viewModelBuilder: () => HomeViewModel());
  }

  Widget endDrawer() {
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
                print('goto change password screen');
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
                print('go to login screen');
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
}
