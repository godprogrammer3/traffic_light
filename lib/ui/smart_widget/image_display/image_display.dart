import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/ui/smart_widget/image_display/image_display_viewmodel.dart';

class ImageDisplay extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String imageName;
  ImageDisplay({Key key, this.height, this.width, this.color, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        builder: (context, model, child) => LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (width == null && height == null) {
                return model.getImage(imageName: imageName, color: color);
              } else if (width == null) {
                return Container(
                  width: constraints.maxWidth,
                  height: height,
                  child: model.getImage(),
                );
              } else if (height == null) {
                return Container(
                  width: width,
                  height: constraints.maxHeight,
                  child: model.getImage(imageName: imageName, color: color),
                );
              } else {
                return Container(
                  width: this.width,
                  height: this.height,
                  child: model.getImage(imageName: imageName, color: color),
                );
              }
            }),
        viewModelBuilder: () => ImageDisplayViewModel());
  }
}
