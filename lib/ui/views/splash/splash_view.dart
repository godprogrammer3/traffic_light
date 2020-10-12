import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/ui/smart_widget/image_display/image_display.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.green,
            body: SafeArea(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Traffic Light",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    ImageDisplay(
                      imageName: 'traffic_icon.png',
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                    )
                  ],
                ),
              ),
            )),
        viewModelBuilder: () => SplashViewModel());
  }
}
