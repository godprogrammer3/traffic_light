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

class RenameIntersectionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final _intersectionService = locator<IntersectionService>();
  Intersection _intersection;
  Intersection get intersection => _intersection;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  void setIntersection(Intersection intersection) {
    this._intersection = intersection;
  }

  Future<int> updateIntesectionName({@required String name}) async {
    if (_formKey.currentState.validate()) {
      _intersection.name = name;
      var result = await _intersectionService.updateIntersectionName(
          id: this._intersection.id, name: name);
      if (result == 0) {
        if (_intersection.type == IntersectionType.Normal) {
          _navigationService.replaceWith(Routes.normalIntersectionView,
              arguments: this._intersection);
        } else if (_intersection.type == IntersectionType.Genius) {
          print('go to genius intersection page');
        } else {
          print(
              'Error Unknow intersection type in rename_intersection_viewmodel > updateIntesectionName');
        }
      }
    }
  }

  void back() {
    _navigationService.back();
  }
}
