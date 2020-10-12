import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/datamodel/user.dart';
import 'package:traffic_light/ui/smart_widget/image_display/image_display.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
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
                model.addIntersection();
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
            body: Center(
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
            ))),
        viewModelBuilder: () => HomeViewModel());
  }
}
