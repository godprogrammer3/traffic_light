import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/datamodel/intersection.dart';
import 'package:traffic_light/datamodel/user.dart';
import 'package:traffic_light/services/authentication_service.dart';
import 'package:traffic_light/services/database_service.dart';

@lazySingleton
class IntersectionService {
  final _databaseService = locator<DatabaseService>();
  final _authenticationService = locator<AuthenticationService>();
  List<Intersection> _intersections;
  List<Intersection> get intersections => _intersections;
  Future<List<Intersection>> getIntersections() async {
    User user = getCurrentUser();
    if (user != null) {
      DataSnapshot result = await _databaseService.getIntersections(user: user);
      if (result.value != null) {
        return Intersection.fromDataSnapshot(result);
      } else {
        return <Intersection>[];
      }
    } else {
      throw UserNotLogIn();
    }
  }

  Future<bool> addIntersection(
      {@required String intersectionId, @required String intersectionName}) {
    User user = getCurrentUser();
    if (user != null) {
      return _databaseService.addIntersection(
          intersectionId: intersectionId,
          intersectionName: intersectionName,
          user: user);
    } else {
      throw UserNotLogIn();
    }
  }

  User getCurrentUser() {
    if (_authenticationService.currentUser != null) {
      return User.fromFirebaseUser(_authenticationService.currentUser);
    } else {
      return null;
    }
  }
}

class UserNotLogIn extends Error {
  String message = 'User not logged in';
}
