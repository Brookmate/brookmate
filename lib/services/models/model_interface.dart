import "package:cloud_firestore/cloud_firestore.dart";

abstract interface class Model {
  Map<String, dynamic> toMap();

  Model.fromDocumentShapshot(DocumentSnapshot<Map<String, dynamic>> doc);
}
