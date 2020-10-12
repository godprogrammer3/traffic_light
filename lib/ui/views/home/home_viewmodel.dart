import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/datamodel/intersection.dart';

class HomeViewModel extends FutureViewModel<List<Intersection>> {
  NavigationService _navigationService = locator<NavigationService>();
  List<Intersection> _intersections;
  List<Intersection> get intersections => _intersections;

  Future<List<Intersection>> getIntersections() async {
    return <Intersection>[];
  }

  @override
  Future<List<Intersection>> futureToRun() {
    return Future.value(<Intersection>[]);
  }

  Future<void> addIntersection() async {
    try {
      ScanResult scanResult = await BarcodeScanner.scan();
      if (scanResult.rawContent != null && scanResult.rawContent != '') {
        print('go to add intersection page');
      } else {
        print('go to add home page');
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        print('Please allow camera permission.');
      } else {
        print('PlaformException error was occurred.');
      }
    } on FormatException {
      print('user cancel');
    } catch (e) {
      print('Unknow error was occurred.');
    }
  }
}
