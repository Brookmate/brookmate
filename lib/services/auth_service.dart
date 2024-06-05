import "package:brookmate/services/database_service.dart";
import "package:brookmate/services/models/owner_model.dart";
import "package:brookmate/services/models/tenant_model.dart";
import "package:brookmate/utils/utils.dart";
import "package:cloud_firestore/cloud_firestore.dart";
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

  static Future<DocumentReference> getCurrentUserRef() async {
    User user = getCurrentUser();
    String docId = Utils.hashify(user.email!);
    try {
      DocumentReference ref =
          await DatabaseService.getDocumentReference(Models.owners, docId);
      return ref;
    } catch (e) {
      DocumentReference ref =
          await DatabaseService.getDocumentReference(Models.tenants, docId);
      return ref;
    }
  }

  static Future<Users> getCurrentUserType() async {
    User user = getCurrentUser();
    String docId = Utils.hashify(user.email!);
    try {
      DocumentReference docref =
          await DatabaseService.getDocumentReference(Models.owners, docId);
      DatabaseService.getDocument(Models.owners, docref.id);
      return Users.owner;
    } catch (e) {
      return Users.tenant;
    }
  }

  static Future<bool> signUpByEmail(
      Users user, String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return Future.value(false);
    }
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
    return Future.value(true);
  }

  static Future<UserCredential> logInByEmail(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // TODO: Build Change Password method

  // TODO: Build change name method

  // TODO: Build change email method

  // TODO: Build log out method

  // TODO: Build remove user method

  // TODO: Build Add Social Account method

  // TODO: Build enable auto login method
}
