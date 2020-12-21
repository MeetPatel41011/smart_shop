import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel _userFromFirebaseUer(FirebaseUser user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUer(user));
  }

  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DatabaseService(uid: result.user.uid).createUserData('New Shop', 0);
      return _userFromFirebaseUer(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUer(result.user);
    } catch (e) {
      // throw e;
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
