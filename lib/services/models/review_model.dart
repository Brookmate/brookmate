import 'package:brookmate/services/models/model_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Review implements Model {
  final String? id;
  final DocumentReference author;
  final DocumentReference house;
  final double rating;
  String title;
  String content;

  Review({
    this.id,
    required this.author,
    required this.house,
    required this.rating,
    required this.title,
    required this.content,
  });

  Review.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        author = doc.data()!["author"],
        house = doc.data()!["house"],
        rating = doc.data()!["rating"],
        title = doc.data()!["title"],
        content = doc.data()!["content"];

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id ?? "None",
      "author": author,
      "house": house,
      "title": title,
      "content": content,
    };
  }
}
