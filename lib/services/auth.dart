import 'package:chai_shai/models/logged_in_user.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/foundation.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoggedInUser? _userFromFirebaseUser(User? user) {
    return user != null ? LoggedInUser(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
