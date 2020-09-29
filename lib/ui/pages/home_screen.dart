import 'package:flutter/material.dart';
import 'package:traffic_light/ui/widgets/image_display.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> _listColors =
      List.generate(2, (index) => Color.fromARGB(255, 232, 245, 233));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                onPressed: () {})
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapDown: (touchDetail) {
                setState(() {
                  _listColors[index] = Colors.grey[300];
                });
              },
              onTapUp: (touchDetail) {
                setState(() {
                  _listColors[index] = Color.fromARGB(255, 232, 245, 233);
                });
              },
              onTapCancel: () {
                setState(() {
                  _listColors[index] = Color.fromARGB(255, 232, 245, 233);
                });
              },
              onTap: () {
                print('tab confirm');
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(2, 2),
                        blurRadius: 1,
                      )
                    ],
                    color: _listColors[index],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
}
