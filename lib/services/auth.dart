import 'package:firebase_auth/firebase_auth.dart';
import 'package:yara/services/userapp.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Create user object based on firebase user
  UserApp? _userFromFirebaseUser(User? userapp) {
    return userapp != null ? UserApp(uid: userapp.uid) : null;
  }

  //Auth change user stream
  Stream<UserApp?> get userapp {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // .map((User? userapp) => _userFromFirebaseUser(userapp!));
  }

  Future signUpUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? userapp = result.user;
      return _userFromFirebaseUser(userapp);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? userapp = result.user;
      return _userFromFirebaseUser(userapp);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
