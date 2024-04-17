import 'package:brookmate/services/models/model_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class House implements Model {
  final String? id;
  final DocumentReference owner;
  final String rentPrice;
  final String location;
  final int deposit;
  final int houseSize; //square feet
  final Map<String, int> transportation;
  final int roomsCount;
  final int bathroomsCount;
  final int maxResidences;
  final int heatingType; // 012 scale (none, radiator, basebord)
  final bool acInstalled;
  final String extraInfo;
  final int status; // 012 scale (off market, on rent, ongoing)

  House({
    this.id,
    required this.owner,
    required this.rentPrice,
    required this.location,
    required this.deposit,
    required this.houseSize, //square feet
    required this.transportation,
    required this.roomsCount,
    required this.bathroomsCount,
    required this.maxResidences,
    required this.heatingType, // 012 scale (none, radiator, basebord)
    required this.acInstalled,
    required this.extraInfo,
    required this.status, // 012 scale (off market, on market, ongoing)
  });

  House.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        owner = doc.data()!["owner"],
        rentPrice = doc.data()!["rent_price"],
        location = doc.data()!["location"],
        deposit = doc.data()!["deposit"],
        houseSize = doc.data()!["house_size"],
        transportation = doc.data()!["transportation"],
        roomsCount = doc.data()!["rooms_count"],
        bathroomsCount = doc.data()!["bathrooms_count"],
        maxResidences = doc.data()!["max_residences"],
        heatingType = doc.data()!["heating_type"],
        acInstalled = doc.data()!["ac_installed"],
        extraInfo = doc.data()!["extra_info"],
        status = doc.data()!["status"];

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id ?? "None",
      "owner": owner,
      "rentPrice": rentPrice,
      "location": location,
      "deposit": deposit,
      "houseSize": houseSize, //square feet
      "transportation": transportation,
      "roomsCount": roomsCount,
      "bathroomsCount": bathroomsCount,
      "maxResidences": maxResidences,
      "heatingType": heatingType, // 012 scale (none, radiator, basebord)
      "acInstalled": acInstalled,
      "extraInfo": extraInfo,
      "status": status, // 012 scale (not for rent, on rent, ongoing)
    };
  }
}
