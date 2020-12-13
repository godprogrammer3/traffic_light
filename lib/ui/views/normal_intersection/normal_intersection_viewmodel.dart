import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/datamodel/intersection.dart';
import 'package:traffic_light/services/database_service.dart';

class NormalIntersectionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  Intersection _intersection;
  StreamSubscription<Event> _streamSubscription;
  void goToHomePage() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  Intersection get intersection => _intersection;
  void setIntersection(Intersection intersection) {
    this._intersection = intersection;
    _streamSubscription = _databaseService
        .onValue(path: 'devices/' + this.intersection.id)
        .listen((event) => eventHandler(event));
  }

  void eventHandler(Event event) {
    print(event.snapshot.value);
    event.snapshot.value['name'] = this.intersection.name;
    this._intersection = Intersection.fromDataSnapshot(event.snapshot);
    notifyListeners();
  }

  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
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
}
