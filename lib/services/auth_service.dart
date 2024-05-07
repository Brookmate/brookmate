import "package:brookmate/services/database_service.dart";
import "package:brookmate/services/models/owner_model.dart";
import "package:brookmate/services/models/tenant_model.dart";
import "package:firebase_auth/firebase_auth.dart";

enum Users { tenant, owner }

class AuthService {
  static late final FirebaseAuth _auth;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    _auth = FirebaseAuth.instance;
    _init = true;
    return _auth;
  }

  static User getCurrentUser() {
    User? user = _auth.currentUser;
    if (user == null) throw Exception("User not logged in");
    return user;
  }

  static void signUpByEmail(
      Users user, String name, String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    switch (user) {
      case Users.owner:
        Owner owner = Owner(email: email, name: name, houses: []);
        DatabaseService.addOwner(owner);
        break;
      case Users.tenant:
        Tenant tenant = Tenant(
            email: email,
            name: name,
            likedHouses: [],
            likedTenants: [],
            myReviews: [],
            allowSearch: true,
            brookmates: []);
        DatabaseService.addTenant(tenant);
        break;
    }
  }

  static void logInByEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // TODO: Build Change Password method

  // TODO: Build change name method

  // TODO: Build change email method

  // TODO: Build log out method

  // TODO: Build remove user method

  // TODO: Build Add Social Account method

  // TODO: Build enable auto login method
}
