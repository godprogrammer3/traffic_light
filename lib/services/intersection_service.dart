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
        List<Map<String, dynamic>> allIntesectionList =
            List<Map<String, dynamic>>();
        List<Intersection> resultIntersections = List<Intersection>();
        result.value.forEach((key, value) {
          allIntesectionList.add({'id': key, 'name': value['name']});
        });
        for (var i = 0; i < allIntesectionList.length; i++) {
          var intersectionSnapshot = await _databaseService.getIntersection(
              id: allIntesectionList[i]['id']);
          intersectionSnapshot.value['name'] = allIntesectionList[i]['name'];
          resultIntersections
              .add(Intersection.fromDataSnapshot(intersectionSnapshot));
        }
        return resultIntersections;
      } else {
        return <Intersection>[];
      }
    } else {
      throw UserNotLogIn();
    }
  }

  Future<bool> addIntersection(
      {@required String intersectionId,
      @required String intersectionName,
      @required String intersectionType}) {
    User user = getCurrentUser();
    if (user != null) {
      return _databaseService.addIntersection(
          intersectionId: intersectionId,
          intersectionName: intersectionName,
          intersectionType: intersectionType,
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

  Future<int> updateIntersectionName(
      {@required String id, @required String name}) async {
    User user = getCurrentUser();
    if (user != null) {
      try {
        await _databaseService
            .update(path: user.id + '/' + id, value: {'name': name});
        return 0;
      } catch (error) {
        print('Error in intersection_service > updateIntersectionName() :');
        print(error);
        return -1;
      }
    } else {
      throw UserNotLogIn();
    }
  }
}

class UserNotLogIn extends Error {
  String message = 'User not logged in';
}
