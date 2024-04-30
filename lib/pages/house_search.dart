import 'package:brookmate/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:brookmate/widgets/house_search_info_1.dart';
import 'package:brookmate/services/models/house_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class HouseSearch extends StatelessWidget {
  const HouseSearch({super.key});
  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Transform.translate(
              offset: const Offset(0, 35),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 226, 226),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                // Searching Bar
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.arrow_back_ios),
                        Text(
                          "Old Airport Rd.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Jun 24 - July 25",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 40.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(77, 209, 196, 196),
                  // borderRadius: BorderRadius.circular(45),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: onTap,
                              child: const ButtonBar(
                                children: [
                                  Icon(Icons.swap_vert),
                                  Text(
                                    "Sort",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: onTap,
                              child: const ButtonBar(
                                children: [
                                  Icon(Icons.tune),
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: onTap,
                              child: const ButtonBar(
                                children: [
                                  Icon(Icons.map),
                                  Text(
                                    "Map",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream:
                            DatabaseService.getCollectionStream(Models.houses),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            final docs = snapshot.data!.docs;
                            if (docs.isEmpty) return const Text('no data');
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return HouseInfo1(
                                  houseName: "${docs[index]['house_name']}\n",
                                  numRating: docs[index]['rating_avg'],
                                  rating: 0,
                                  numReviews: 0,
                                  numKm: 0,
                                  numBeds: docs[index]['rooms_count'],
                                  numBath: docs[index]['bathrooms_count'],
                                  rent: docs[index]['rent_price'],
                                  isFreeElec: false,
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
