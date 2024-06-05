import 'package:brookmate/services/models/house_model.dart';
import 'package:brookmate/services/models/model_interface.dart';
import 'package:brookmate/services/models/owner_model.dart';
import 'package:brookmate/services/models/persona_model.dart';
import 'package:brookmate/services/models/review_model.dart';
import 'package:brookmate/services/models/tenant_model.dart';
import 'package:brookmate/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Models { owners, tenants, persona, houses, reviews }

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
    "owners",
    "tenants",
    "persona",
    "houses",
    "reviews"
  ];

  // Create
  static Future<DocumentReference> addHouse(House houseData) async {
    return await _db.collection("houses").add(houseData.toMap());
  }

  static Future<DocumentReference> addOwner(Owner ownerData) async {
    String docId = Utils.hashify(ownerData.email);
    ownerData.id = docId;
    await _db.collection("owners").doc(docId).set(ownerData.toMap());
    return _db.collection("owners").doc(docId);
  }

  static Future<DocumentReference> addTenant(Tenant tenantData) async {
    String docId = Utils.hashify(tenantData.email);
    tenantData.id = docId;
    await _db.collection("owners").doc(docId).set(tenantData.toMap());
    return _db.collection("owners").doc(docId);
  }

  static Future<DocumentReference> addPersona(Persona personaData) async {
    return await _db.collection("persona").add(personaData.toMap());
  }

  static Future<DocumentReference> addReview(Review reviewData) async {
    return await _db.collection("reviews").add(reviewData.toMap());
  }

  // Read (Single)
  static Future<Model> getDocument(Models model, String documentId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection(_models[model.index]).doc(documentId).get();
    if (!snapshot.exists) {
      throw Exception("Document does not exist");
    }
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

  static Future<DocumentReference> getDocumentReference(
      Models model, String documentId) async {
    var snapshot =
        await _db.collection(_models[model.index]).doc(documentId).get();
    if (!snapshot.exists) {
      throw Exception("Document does not exist");
    }
    return _db.collection(_models[model.index]).doc(documentId);
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getDocumentStream(
      Models model, String documentId) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> snapshot =
        _db.collection(_models[model.index]).doc(documentId).snapshots();
    return snapshot;
  }

  // Read (Multiple)
  static Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream(
      Models model) {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        _db.collection(_models[model.index]).snapshots();
    return snapshot;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
      getCollectionStreamWithSorting(
          Models model, String? sortBy, RangeValues priceRange) {
    Query<Map<String, dynamic>> collection =
        _db.collection(_models[model.index].toString());

    // Add sorting based on rent_price if specified
    if (model == Models.houses && sortBy != null) {
      if (sortBy == 'Lowest') {
        collection = collection.orderBy('rent_price', descending: false);
      } else if (sortBy == 'Highest') {
        collection = collection.orderBy('rent_price', descending: true);
      } else if (sortBy == 'low_rating') {
        collection = collection.orderBy('rating_avg', descending: false);
      } else if (sortBy == 'high_rating') {
        collection = collection.orderBy('rating_avg', descending: true);
      }
    }
    // Add filtering based on price range
    if (model == Models.houses) {
      collection = collection
          .where('rent_price', isGreaterThanOrEqualTo: priceRange.start)
          .where('rent_price', isLessThanOrEqualTo: priceRange.end);
    }
    return collection.snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
      getCollectionStreamWithSearch(Models model, String keyword) {
    Query<Map<String, dynamic>> collection =
        _db.collection(_models[model.index]);
    if (keyword.isNotEmpty) {
      collection =
          collection.where('searchField', arrayContains: keyword.toLowerCase());
    }
    return collection.snapshots();
  }

  // Update
  static void updateHouse(House houseData) async {
    await _db.collection("houses").doc(houseData.id).update(houseData.toMap());
  }

  static void updateOwner(Owner ownerData) async {
    await _db.collection("owners").doc(ownerData.id).update(ownerData.toMap());
  }

  static void updateTenant(Tenant tenantData) async {
    await _db
        .collection("tenants")
        .doc(tenantData.id)
        .update(tenantData.toMap());
  }

  static void updatePersona(Persona personaData) async {
    await _db
        .collection("persona")
        .doc(personaData.id)
        .update(personaData.toMap());
  }

  static void updateReview(Review reviewData) async {
    await _db
        .collection("reviews")
        .doc(reviewData.id)
        .update(reviewData.toMap());
  }

  // Delete
  static void deleteHouse(String houseId) async {
    await _db.collection("houses").doc(houseId).delete();
  }

  static void deleteOwner(String ownerId) async {
    await _db.collection("owners").doc(ownerId).delete();
  }

  static void deleteTenant(String tenantId) async {
    await _db.collection("tenants").doc(tenantId).delete();
  }

  static void deletePersona(String personaId) async {
    await _db.collection("persona").doc(personaId).delete();
  }

  static void deleteReview(String reviewId) async {
    await _db.collection("reviews").doc(reviewId).delete();
  }
}
