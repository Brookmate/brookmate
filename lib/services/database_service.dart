import 'package:brookmate/services/models/house_model.dart';
import 'package:brookmate/services/models/owner_model.dart';
import 'package:brookmate/services/models/persona_model.dart';
import 'package:brookmate/services/models/tenant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create
  void addHouse(House houseData) async {
    await _db.collection("Houses").add(houseData.toMap());
  }

  void addOwner(Owner ownerData) async {
    await _db.collection("Owners").add(ownerData.toMap());
  }

  void addTenant(Tenant tenantData) async {
    await _db.collection("Tenants").add(tenantData.toMap());
  }

  void addPersona(Persona personaData) async {
    await _db.collection("Employees").add(personaData.toMap());
  }

  // Read (Single)
  Future<House> getHouse(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Houses").doc(ref.id).get();
    return House.fromDocumentSnapshot(snapshot);
  }

  Future<Owner> getOwner(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Owners").doc(ref.id).get();
    return Owner.fromDocumentSnapshot(snapshot);
  }

  Future<Tenant> getTenant(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Tenants").doc(ref.id).get();
    return Tenant.fromDocumentSnapshot(snapshot);
  }

  Future<Persona> getPersona(DocumentReference ref) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Persona").doc(ref.id).get();
    return Persona.fromDocumentSnapshot(snapshot);
  }

  // Read (Multiple)
  Future<List<House>> getHousesSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Houses").get();
    return snapshot.docs
        .map((docSnapshot) => House.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<Owner>> getOwnersSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Owners").get();
    return snapshot.docs
        .map((docSnapshot) => Owner.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<Tenant>> getTenantsSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Tenants").get();
    return snapshot.docs
        .map((docSnapshot) => Tenant.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<Tenant>> getPersonaSnapshot() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Persona").get();
    return snapshot.docs
        .map((docSnapshot) => Tenant.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  // Update
  void updateHouse(House houseData) async {
    await _db.collection("Houses").doc(houseData.id).update(houseData.toMap());
  }

  void updateOwner(Owner ownerData) async {
    await _db.collection("Owners").doc(ownerData.id).update(ownerData.toMap());
  }

  void updateTenant(Tenant tenantData) async {
    await _db
        .collection("Tenants")
        .doc(tenantData.id)
        .update(tenantData.toMap());
  }

  void updatePersona(Persona personaData) async {
    await _db
        .collection("Employees")
        .doc(personaData.id)
        .update(personaData.toMap());
  }

  // Delete
  void deleteHouse(String houseId) async {
    await _db.collection("Houses").doc(houseId).delete();
  }

  void deleteOwner(String ownerId) async {
    await _db.collection("Owners").doc(ownerId).delete();
  }

  void deleteTenant(String tenantId) async {
    await _db.collection("Tenants").doc(tenantId).delete();
  }

  void deletePersona(String personaId) async {
    await _db.collection("Employees").doc(personaId).delete();
  }
}
