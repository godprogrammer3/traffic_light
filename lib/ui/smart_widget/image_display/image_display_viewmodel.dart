import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ImageDisplayViewModel extends BaseViewModel {
  final String _assetPath = 'assets/images/';
  Widget getImage({String imageName, Color color}) {
    if (imageName.contains('.svg')) {
      return SvgPicture.asset(
        _assetPath + imageName,
        semanticsLabel: 'svg img',
        color: color,
      );
    } else {
      return Image.asset(
        _assetPath + imageName,
        fit: BoxFit.contain,
      );
    }
  }
}
