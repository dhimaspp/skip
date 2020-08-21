import 'package:firebase_auth/firebase_auth.dart';
import 'package:skip/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object base on firebase user
  Users _userFromFirebase(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Users> get streamUser {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  //Sign in anonim method
  Future signInAnonim() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email/password method

  //register im email/password method

  //sign out method

}
