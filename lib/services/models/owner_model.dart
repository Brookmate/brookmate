import 'package:brookmate/services/models/model_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Owner implements Model {
  final String? id;
  final String email;
  final String name;
  final List<DocumentReference> houses;

  Owner({
    this.id,
    required this.email,
    required this.name,
    required this.houses,
  });

  Owner.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        email = doc.data()!["email"],
        name = doc.data()!["name"],
        houses = doc.data()!["houses"];

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id ?? "None",
      "email": email,
      "name": name,
      "houses": houses,
    };
  }
}
