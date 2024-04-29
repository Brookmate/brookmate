import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  static late final FirebaseAuth _auth;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    _auth = FirebaseAuth.instance;
    _init = true;
    return _auth;
  }

  // TODO: Build Sign Up method

  // TODO: Build Log In method

  // TODO: Build
}
