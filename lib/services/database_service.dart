import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DatabaseService {
  final _firebaseDb = FirebaseDatabase.instance;
  Future<DataSnapshot> getIntersections({@required String uid}) async {
    var result = await _firebaseDb.reference().child(uid).once();
    return result;
  }

  Future<bool> addIntersection() {}
}
