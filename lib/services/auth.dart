import 'package:firebase_auth/firebase_auth.dart';
import 'package:skip/services/exception_handler.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthResultStatus _status;

  //Create user object base on firebase uid
  AuthResultStatus _userFromFirebase(User user) {
    return user != null ? AuthResultStatus.successful : null;
  }

  //auth change user stream
  Stream<AuthResultStatus> get streamStatus {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  //sign in using gmail
  Future loginWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final UserCredential result = await _auth.signInWithCredential(credential);
    final User user = result.user;
    _status = AuthResultStatus.successful;
    return _userFromFirebase(user);
  }

  //sign in email/password method
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      if (result.user != null) {
        _status = AuthResultStatus.successful;
        return _userFromFirebase(user);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('exception @loginWithEmailAndPassword: $e'.toString());
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  //register im email/password method
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User user = result.user;
      if (result.user != null) {
        _status = AuthResultStatus.successful;
        return _userFromFirebase(user);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('exception @registerWithEmailAndPassword: $e'.toString());
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  //Reset password base on email Request
  Future<void> sendPasswordResetEmailReq(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  //Recover password
  Future resetPasswort(String password) async {
    return await _auth.confirmPasswordReset();
  }

  //sign out method
  Future logOut() async {
    try {
      return await _auth.signOut().then((_) {
        _googleSignIn.signOut();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
