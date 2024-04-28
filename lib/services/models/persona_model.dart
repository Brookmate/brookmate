import 'package:brookmate/services/models/model_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Persona implements Model {
  final String? id;
  final DocumentSnapshot user;
  int cleaness; // 5 scale
  final Map<String, String> sleepingTime;
  bool isSmoker;
  int drinkingRate; // 5 scale
  int inviteGuests; // 5 scale
  int sociability; // 5 scale
  bool canDrive;
  final Map<String, String> stayingSchedule;
  String sex;
  final Map<String, String> budget;
  String nationality;

  Persona({
    this.id,
    required this.user,
    required this.cleaness,
    required this.sleepingTime,
    required this.isSmoker,
    required this.drinkingRate,
    required this.inviteGuests,
    required this.sociability,
    required this.canDrive,
    required this.stayingSchedule,
    required this.sex,
    required this.budget,
    required this.nationality,
  });

  Persona.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        user = doc.data()!["user"],
        cleaness = doc.data()!["cleaness"],
        sleepingTime = doc.data()!["sleeping_time"],
        isSmoker = doc.data()!["is_smoker"],
        drinkingRate = doc.data()!["drinking_rate"],
        inviteGuests = doc.data()!["invite_guests"],
        sociability = doc.data()!["sociability"],
        canDrive = doc.data()!["can_drive"],
        stayingSchedule = doc.data()!["staying_schedule"],
        sex = doc.data()!["sex"],
        budget = doc.data()!["budget"],
        nationality = doc.data()!["nationality"];

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id ?? "None",
      "user": user,
      "cleaness": cleaness,
      "sleepingTime": sleepingTime,
      "isSmoker": isSmoker,
      "drinkingRate": drinkingRate,
      "inviteGuests": inviteGuests,
      "sociability": sociability,
      "canDrive": canDrive,
      "stayingSchedule": stayingSchedule,
      "sex": sex,
      "budget": budget,
      "nationality": nationality,
    };
  }
}
