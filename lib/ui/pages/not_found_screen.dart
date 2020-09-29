import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Not found !'),
      ),
      body: Center(
        child: Text(
          "Error page not found.",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
