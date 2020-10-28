import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

class User {
  String id;
  User({this.id});
  User.fromFirebaseUser(firebaseAuth.User user) {
    this.id = user.uid;
  }
}
