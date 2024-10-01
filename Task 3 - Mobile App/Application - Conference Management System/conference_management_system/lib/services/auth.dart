import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // [_] means the object is private
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user as User;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password

  // sign out
}
