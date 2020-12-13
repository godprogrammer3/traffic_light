import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/datamodel/user.dart';
import 'package:traffic_light/services/intersection_service.dart';

class AddIntersectionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final _intersectionService = locator<IntersectionService>();
  final _formKey = GlobalKey<FormState>();
  final _snackbarService = locator<SnackbarService>();
  GlobalKey<FormState> get formkey => _formKey;
  void goToHomePage() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  Future<void> addIntersection({
    @required String intersectionId,
    @required String intersectionName,
    @required String intersectionType,
  }) async {
    try {
      setBusy(true);
      var result = await _intersectionService.addIntersection(
          intersectionId: intersectionId,
          intersectionName: intersectionName,
          intersectionType: intersectionType);
      setBusy(false);
      if (result) {
        _navigationService.clearStackAndShow(Routes.homeView);
      }
    } catch (error) {
      _snackbarService.showSnackbar(
        title: 'Error',
        message: error.message,
        duration: Duration(seconds: 2),
      );
    }
  }
}
