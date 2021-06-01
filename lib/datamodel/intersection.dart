import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

enum IntersectionType { Genius, Normal, Unknown }
enum Mode { Auto, Manual, Flashing, AllRed, Actuated, SignalChange, Unknown }

class Intersection {
  String id;
  String name;
  IntersectionType type;
  Mode mode;
  int plan;
  int currentButton;
  DateTime timeStamp;
  Duration timeCount;
  Intersection(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.mode,
      @required this.plan,
      @required this.currentButton,
      @required this.timeStamp,
      @required this.timeCount});

  Intersection.fromKeyValue(String key, Map<dynamic, dynamic> value) {
    this.id = key;
    this.name = value['name'];
    if (value['type'] == 'genius') {
      this.type = IntersectionType.Genius;
    } else if (value['type'] == 'normal') {
      this.type = IntersectionType.Normal;
    } else {
      this.type = IntersectionType.Unknown;
    }
    if (value['mode'] == 'Auto') {
      this.mode = Mode.Auto;
    } else if (value['mode'] == 'Manual') {
      this.mode = Mode.Manual;
    } else if (value['mode'] == 'Flashing') {
      this.mode = Mode.Flashing;
    } else if (value['mode'] == 'AllRed') {
      this.mode = Mode.AllRed;
    } else if (value['mode'] == 'Actuated') {
      this.mode = Mode.Actuated;
    } else if (value['mode'] == 'SignalChange') {
      this.mode = Mode.SignalChange;
    } else {
      this.mode = Mode.Unknown;
    }
    this.plan = value['plan'] ?? -1;
    this.currentButton = value['currentButton'] ?? -1;
    this.timeStamp = (value['timeStamp'] != null)
        ? new DateTime.fromMillisecondsSinceEpoch(value['timeStamp'] * 1000)
        : null;
    this.timeCount = (value['timeCount'] != null)
        ? new Duration(seconds: value['timeCount'])
        : null;
  }
  static Intersection fromDataSnapshot(DataSnapshot snapshot) {
    Intersection resultIntersection =
        Intersection.fromKeyValue(snapshot.key, snapshot.value);
    return resultIntersection;
  }

  String toString() {
    return '''Intersection{
      id : ${this.id},
      name : ${this.name},
      type : ${this.type},
      mode : ${this.mode},
      plan : ${this.plan},
      currentButton : ${this.currentButton},
      timeStamp: ${this.timeStamp},
      timeCount: ${this.timeCount}
    }''';
  }
}
