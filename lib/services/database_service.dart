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

  Future<DataSnapshot> getIntersection({@required String id}) async {
    var result =
        await _firebaseDb.reference().child('devices').child(id).once();
    return result;
  }

  Future<bool> addIntersection(
      {@required String intersectionId,
      @required String intersectionName,
      @required String intersectionType,
      @required User user}) async {
    try {
      await _firebaseDb
          .reference()
          .child(user.id)
          .child(intersectionId)
          .set({'name': intersectionName, 'type': intersectionType});
      return true;
    } catch (error) {
      return false;
    }
  }

  Stream<Event> onValue({@required String path}) {
    return _firebaseDb.reference().child(path).onValue;
  }

  Future<int> update(
      {@required String path, @required Map<String, dynamic> value}) async {
    try {
      await _firebaseDb.reference().child(path).update(value);
      return 0;
    } catch (error) {
      print('Error in database_service > update():');
      print(error);
      return -1;
    }
  }
}
