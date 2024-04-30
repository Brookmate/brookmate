import 'package:brookmate/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String searchValue = "";
List<QueryDocumentSnapshot<Map<String, dynamic>>> searchedList(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> results = [];
  if (docs.isEmpty) {
    return results;
  } else {
    results = docs
        .where((element) =>
            element['name'].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();
  }
  return results;
}

// ignore: must_be_immutable
class Topbar extends StatefulWidget {
  List<String> friendsList;
  Topbar({
    super.key,
    required this.friendsList,
  });

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  final List<String> friendsNames = [];

  List<String> filteredList() {
    return friendsNames.where((name) => name.contains(searchValue)).toList();
  }

  String SearchValue() {
    return searchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 7,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color(0xff9C0000),
              ),
            ),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Color(0xff9C0000),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  filteredList().length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
