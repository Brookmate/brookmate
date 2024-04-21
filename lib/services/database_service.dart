import 'package:brookmate/services/models/house_model.dart';
import 'package:brookmate/services/models/owner_model.dart';
import 'package:brookmate/services/models/persona_model.dart';
import 'package:brookmate/services/models/tenant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static late final FirebaseFirestore _db;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    _db = FirebaseFirestore.instance;
    _init = true;
    return _db;
  }

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
    await _db.collection("Employees").add(personaData.toMap());
  }

  // Read (Single)
  static Future<House> getHouse(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Houses").doc(ref.id).get();
    return House.fromDocumentSnapshot(snapshot);
  }

  static Future<Owner> getOwner(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Owners").doc(ref.id).get();
    return Owner.fromDocumentSnapshot(snapshot);
  }

  static Future<Tenant> getTenant(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Tenants").doc(ref.id).get();
    return Tenant.fromDocumentSnapshot(snapshot);
  }

  static Future<Persona> getPersona(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Persona").doc(ref.id).get();
    return Persona.fromDocumentSnapshot(snapshot);
  }

  // Read (Multiple)
  static Future<List<House>> getHousesSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Houses").get();
    return snapshot.docs
        .map((docSnapshot) => House.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  static Future<List<Owner>> getOwnersSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Owners").get();
    return snapshot.docs
        .map((docSnapshot) => Owner.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  static Future<List<Tenant>> getTenantsSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Tenants").get();
    return snapshot.docs
        .map((docSnapshot) => Tenant.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  static Future<List<Tenant>> getPersonaSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Persona").get();
    return snapshot.docs
        .map((docSnapshot) => Tenant.fromDocumentSnapshot(docSnapshot))
        .toList();
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
        .collection("Employees")
        .doc(personaData.id)
        .update(personaData.toMap());
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
    await _db.collection("Employees").doc(personaId).delete();
  }
}
