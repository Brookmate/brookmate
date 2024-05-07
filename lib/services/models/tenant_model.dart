import 'package:brookmate/services/models/model_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tenant implements Model {
  String? id;
  String email;
  String name;
  final List<DocumentReference> likedHouses;
  final List<DocumentReference> likedTenants;
  final List<DocumentReference> myReviews;
  DocumentReference? persona;
  final Map<String, String>? sns;
  bool allowSearch;
  final List<DocumentReference> brookmates;

  Tenant({
    this.id,
    required this.email,
    required this.name,
    required this.likedHouses,
    required this.likedTenants,
    required this.myReviews,
    this.persona,
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
        myReviews = doc.data()!["my_reviews"],
        persona = doc.data()!["persona"],
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
      "myReviews": myReviews,
      "persona": persona,
      "sns": sns,
      "allowSearch": allowSearch,
      "brookmates": brookmates,
    };
  }
}
