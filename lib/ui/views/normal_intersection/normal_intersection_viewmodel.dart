import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/datamodel/intersection.dart';
import 'package:traffic_light/services/database_service.dart';
import 'package:ntp/ntp.dart';

class NormalIntersectionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  Intersection _intersection;
  StreamSubscription<Event> _streamSubscription;
  String _display = "loading";
  Timer _timer;
  Duration _timeCounter;
  void goToHomePage() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  String get display => _display;
  Intersection get intersection => _intersection;
  void setIntersection(Intersection intersection) {
    this._intersection = intersection;
    _streamSubscription = _databaseService
        .onValue(path: 'devices/' + this.intersection.id)
        .listen((event) => eventHandler(event));
  }

  void eventHandler(Event event) async {
    event.snapshot.value['name'] = this.intersection.name;
    _intersection = Intersection.fromDataSnapshot(event.snapshot);
    print(_intersection);
    if (_intersection.mode == Mode.AllRed) {
      _display = 'ALLRED';
      if (_timer != null) {
        _timer.cancel();
      }
    } else if (_intersection.mode == Mode.Flashing) {
      _display = 'FLASH';
      if (_timer != null) {
        _timer.cancel();
      }
    } else if (_intersection.mode == Mode.Manual) {
      if (_intersection.timeStamp != null) {
        DateTime nowTime = await NTP.now();
        _timeCounter = nowTime.difference(_intersection.timeStamp);
        if (_timer != null) {
          _timer.cancel();
        }
        if (_timeCounter.inMinutes < 60) {
          _timer = Timer.periodic(const Duration(seconds: 1), updateCounterUp);
        } else {
          _timeCounter = const Duration(minutes: 59, seconds: 59);
          _display = _durationToMMSS(_timeCounter);
          notifyListeners();
        }
      }
    } else if (_intersection.mode == Mode.Auto) {
      if (_intersection.timeStamp != null) {
        DateTime nowTime = await NTP.now();
        _timeCounter = nowTime.difference(_intersection.timeStamp);
        _timeCounter = (_intersection.timeCount != null)
            ? _intersection.timeCount - _timeCounter
            : const Duration(seconds: 0);
        if (_timer != null) {
          _timer.cancel();
        }
        if (!_timeCounter.isNegative && _timeCounter.inSeconds != 0) {
          _timer =
              Timer.periodic(const Duration(seconds: 1), updateCounterDown);
        } else {
          _timeCounter = const Duration(seconds: 0);
          _display = _durationToMMSS(_timeCounter);
          notifyListeners();
        }
        print(_timeCounter);
      }
    }
    notifyListeners();
  }

  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
    }
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  Future<int> updateIntesection({@required Map<String, dynamic> value}) async {
    return _databaseService.update(
        path: 'devices/' + this._intersection.id, value: value);
  }

  void gotoRenameIntersectionPage() {
    _navigationService.navigateTo(Routes.renameIntersectionView,
        arguments: _intersection);
  }

  void updateCounterUp(Timer timer) {
    if (_timeCounter.inMinutes < 60) {
      _timeCounter += const Duration(seconds: 1);
      _display = _durationToMMSS(_timeCounter);
    } else {
      _timeCounter = const Duration(minutes: 59, seconds: 59);
      _display = _durationToMMSS(_timeCounter);
      timer.cancel();
    }

    notifyListeners();
  }

  void updateCounterDown(Timer timer) {
    if (_timeCounter.inSeconds > 1) {
      _timeCounter -= const Duration(seconds: 1);
      _display = _durationToMMSS(_timeCounter);
    } else {
      _timeCounter = const Duration(minutes: 0, seconds: 0);
      _display = _durationToMMSS(_timeCounter);
      timer.cancel();
    }
    notifyListeners();
  }

  String _durationToMMSS(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
