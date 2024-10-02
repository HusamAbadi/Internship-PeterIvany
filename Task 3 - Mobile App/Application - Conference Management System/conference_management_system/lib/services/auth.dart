import 'package:conference_management_system/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Private FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create custom user object based on Firebase User object
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get userStream {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // * Same as
    // .map((User? user) => _userFromFirebaseUser(user));
  }

  // Sign in anonymously
  Future<AppUser?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Other authentication methods (sign in, register, sign out) can be added here

  //sign in with email & password

  // register with email & password

  // sign out
  Future signOut() async {
    // The outer signOut() Method is user-defined
    try {
      return await _auth.signOut();
      // The inner signOut() Method is built-in within Firebase Auth Library
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
