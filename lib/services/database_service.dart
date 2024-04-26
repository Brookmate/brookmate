import 'package:brookmate/services/models/house_model.dart';
import 'package:brookmate/services/models/model_interface.dart';
import 'package:brookmate/services/models/owner_model.dart';
import 'package:brookmate/services/models/persona_model.dart';
import 'package:brookmate/services/models/review_model.dart';
import 'package:brookmate/services/models/tenant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Models { tenants, owners, persona, houses, reviews }

class DatabaseService {
  static late final FirebaseFirestore _db;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    _db = FirebaseFirestore.instance;
    _init = true;
    return _db;
  }

  static final List<String> _models = [
    "Owners",
    "Tenants",
    "Persona",
    "Houses",
    "Reviews"
  ];

  // Create
  static void addHouse(House houseData) async {
    await _db.collection("Houses").add(houseData.toMap());
  }

  static void addOwner(Owner ownerData) async {
    await _db.collection("Owners").add(ownerData.toMap());
  }

  static void addTenant(Tenant tenantData) async {
    await _db.collection("Tenants").add(tenantData.toMap());
  }

  static void addPersona(Persona personaData) async {
    await _db.collection("Persona").add(personaData.toMap());
  }

  static void addReview(Review reviewData) async {
    await _db.collection("Reviews").add(reviewData.toMap());
  }

  // Read (Single)
  static Future<Model> getDocument(Models model, DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection(_models[model.index]).doc(ref.id).get();
    switch (model) {
      case Models.houses:
        return House.fromDocumentSnapshot(snapshot);
      case Models.owners:
        return Owner.fromDocumentSnapshot(snapshot);
      case Models.tenants:
        return Tenant.fromDocumentSnapshot(snapshot);
      case Models.persona:
        return Persona.fromDocumentSnapshot(snapshot);
      case Models.reviews:
        return Review.fromDocumentSnapshot(snapshot);
      default:
        throw Exception("Invalid type entered");
    }
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getDocumentStream(
      Models model, DocumentReference ref) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> snapshot =
        _db.collection(_models[model.index]).doc(ref.id).snapshots();
    return snapshot;
  }

  // Read (Multiple)
  static Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream(
      Models model) {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        _db.collection(_models[model.index]).snapshots();
    return snapshot;
  }

  // Update
  static void updateHouse(House houseData) async {
    await _db.collection("Houses").doc(houseData.id).update(houseData.toMap());
  }

  static void updateOwner(Owner ownerData) async {
    await _db.collection("Owners").doc(ownerData.id).update(ownerData.toMap());
  }

  static void updateTenant(Tenant tenantData) async {
    await _db
        .collection("Tenants")
        .doc(tenantData.id)
        .update(tenantData.toMap());
  }

  static void updatePersona(Persona personaData) async {
    await _db
        .collection("Persona")
        .doc(personaData.id)
        .update(personaData.toMap());
  }

  static void updateReview(Review reviewData) async {
    await _db
        .collection("Reviews")
        .doc(reviewData.id)
        .update(reviewData.toMap());
  }

  // Delete
  static void deleteHouse(String houseId) async {
    await _db.collection("Houses").doc(houseId).delete();
  }

  static void deleteOwner(String ownerId) async {
    await _db.collection("Owners").doc(ownerId).delete();
  }

  static void deleteTenant(String tenantId) async {
    await _db.collection("Tenants").doc(tenantId).delete();
  }

  static void deletePersona(String personaId) async {
    await _db.collection("Persona").doc(personaId).delete();
  }

  static void deleteReview(String reviewId) async {
    await _db.collection("Persona").doc(reviewId).delete();
  }
}
