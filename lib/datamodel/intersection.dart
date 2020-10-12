import 'package:flutter/foundation.dart';

enum IntersectionType { Genius, Normal }
enum Mode { Auto, Manual, Flashing, AllRed, Actuated, SignalChange }

class Intersection {
  String id;
  String title;
  IntersectionType type;
  Mode mode;
  int plan;
  int currentButton;
  Intersection(
      {@required this.id,
      @required this.title,
      @required this.type,
      @required this.mode,
      @required this.plan,
      @required this.currentButton});
}
