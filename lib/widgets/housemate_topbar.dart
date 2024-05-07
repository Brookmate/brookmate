import 'package:brookmate/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Topbar extends StatefulWidget {
  List<String> friendsList;
  Topbar({
    super.key,
    required this.updatesearchValue,
    required this.friendsList,
  });
  final Function(String) updatesearchValue;

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  final List<String> friendsNames = [];
  TextEditingController textController = TextEditingController();

  List<String> filteredList() {
    return friendsNames.where((name) => name.contains(searchValue)).toList();
  }

  String searchValue = "";

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
              controller: textController,
              onSubmitted: (value) {
                setState(() {
                  searchValue = textController.text;
                  widget.updatesearchValue(value);
                });
              },
              onChanged: (value) {
                setState(() {
                  searchValue = textController.text;
                  widget.updatesearchValue(value);
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
