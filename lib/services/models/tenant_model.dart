import 'package:brookmate/services/models/model_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tenant implements Model {
  final String? id;
  final String email;
  final String name;
  final List<DocumentReference> likedHouses;
  final List<DocumentReference> likedTenants;
  final DocumentReference? persona;
  final List<String>? personaPriorities;
  Map<String, String>? sns;
  bool allowSearch;
  final List<DocumentReference> brookmates;

  Tenant({
    this.id,
    required this.email,
    required this.name,
    required this.likedHouses,
    required this.likedTenants,
    this.persona,
    this.personaPriorities,
    this.sns,
    required this.allowSearch,
    required this.brookmates,
  });

  Tenant.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        email = doc.data()!["email"],
        name = doc.data()!["name"],
        likedHouses = doc.data()!["liked_houses"],
        likedTenants = doc.data()!["liked_tenants"],
        persona = doc.data()!["persona"],
        personaPriorities = doc.data()!["priorities"],
        sns = doc.data()!["sns"],
        allowSearch = doc.data()!["allow_search"],
        brookmates = doc.data()!["brookmates"];

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id ?? "None",
      "email": email,
      "name": name,
      "likedHouses": likedHouses,
      "likedTenants": likedTenants,
      "persona": persona,
      "personaPriorities": personaPriorities,
      "sns": sns,
      "allowSearch": allowSearch,
      "brookmates": brookmates,
    };
  }
}
