import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:traffic_light/datamodel/user.dart';

@lazySingleton
class DatabaseService {
  final _firebaseDb = FirebaseDatabase.instance;
  Future<DataSnapshot> getIntersections({@required User user}) async {
    var result = await _firebaseDb.reference().child(user.id).once();
    return result;
  }

  Future<bool> addIntersection(
      {@required String intersectionId,
      @required String intersectionName,
      @required User user}) async {
    try {
      await _firebaseDb
          .reference()
          .child(user.id)
          .child(intersectionId)
          .set({'name': intersectionName});
      return true;
    } catch (error) {
      return false;
    }
  }
}
