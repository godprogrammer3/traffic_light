import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/datamodel/intersection.dart';
import 'package:traffic_light/services/authentication_service.dart';
import 'package:traffic_light/services/intersection_service.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _snackbarService = locator<SnackbarService>();
  final _intersectionService = locator<IntersectionService>();
  final _authenticationService = locator<AuthenticationService>();
  List<Intersection> _intersections = List<Intersection>();
  List<Intersection> get intersections => _intersections;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  Future<void> getIntersections() async {
    setBusy(true);
    _intersections = await _intersectionService.getIntersections();
    setBusy(false);
    notifyListeners();
  }

  Future<void> addIntersection() async {
    try {
      ScanResult scanResult = await BarcodeScanner.scan();
      if (scanResult.rawContent != null && scanResult.rawContent != '') {
        _navigationService.navigateTo(Routes.addIntersectionView,
            arguments: scanResult.rawContent);
      } else {
        _navigationService.back();
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        _snackbarService.showSnackbar(
          message: 'Please allow camera permission.',
          duration: Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          title: 'Error',
          message: 'PlaformException error was occurred.',
          duration: Duration(seconds: 2),
        );
      }
    } on FormatException {
      _navigationService.back();
    } catch (e) {
      _snackbarService.showSnackbar(
        title: 'Error',
        message: 'Unknow error was occurred.',
        duration: Duration(seconds: 2),
      );
    }
  }

  void openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  Future<void> logOut() async {
    this.setBusy(true);
    var result = await _authenticationService.signOut();
    this.setBusy(false);
    if (result == 0) {
      _navigationService.clearStackAndShow(Routes.loginView);
    } else {
      _navigationService.back();
      _snackbarService.showSnackbar(
        message: 'Log out error please try again',
        duration: Duration(seconds: 2),
      );
    }
  }

  Future<void> openIntersection(
    int index,
  ) async {
    if (this._intersections[index] != null) {
      if (this._intersections[index].type == IntersectionType.Normal) {
        _navigationService.navigateTo(Routes.normalIntersectionView,
            arguments: this._intersections[index]);
      } else if (this._intersections[index].type == IntersectionType.Genius) {
        print('goto intersection type genius');
      } else {
        _snackbarService.showSnackbar(
          message: 'Error unknow intersection type',
          duration: Duration(seconds: 2),
        );
      }
    } else {
      _snackbarService.showSnackbar(
        message: 'Open intersection error',
        duration: Duration(seconds: 2),
      );
    }
  }
}
