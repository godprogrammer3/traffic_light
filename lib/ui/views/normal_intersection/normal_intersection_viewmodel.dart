import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/datamodel/intersection.dart';
import 'package:traffic_light/services/database_service.dart';
import 'package:traffic_light/services/intersection_service.dart';

class NormalIntersectionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final _intersectionService = locator<IntersectionService>();
  final _formKey = GlobalKey<FormState>();
  final _snackbarService = locator<SnackbarService>();
  final _databaseService = locator<DatabaseService>();
  Intersection _intersection;
  GlobalKey<FormState> get formkey => _formKey;
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
        path: 'devices/' + this.intersection.id, value: value);
  }
}
