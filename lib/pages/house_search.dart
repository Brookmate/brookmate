import 'package:brookmate/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brookmate/widgets/house_search_info_listview.dart';
import 'package:brookmate/pages/house_map.dart';
import 'package:brookmate/pages/housemate.dart';

class HouseSearch extends StatefulWidget {
  const HouseSearch({super.key});

  @override
  State<HouseSearch> createState() => _HouseSearchState();
}

class _HouseSearchState extends State<HouseSearch> {
  String _sortOption = 'Lowest';
  RangeValues _budget = const RangeValues(0, 10000); // Define budget here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 15,
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                    // Sorting, Filtering, and Map buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Sort By'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _sortOption =
                                                    'Lowest'; // Set sort option to 'Lowest'
                                              });
                                            },
                                            child: const Text('Lowest'),
                                          ),
                                          const Divider(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _sortOption =
                                                    'Highest'; // Set sort option to 'Highest'
                                              });
                                            },
                                            child: const Text('Highest'),
                                          ),
                                          const Divider(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _sortOption =
                                                    'low_rating'; // Set sort option to 'Low Rating'
                                              });
                                            },
                                            child: const Text('Low Rating'),
                                          ),
                                          const Divider(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _sortOption =
                                                    'high_rating'; // Set sort option to 'High Rating'
                                              });
                                            },
                                            child: const Text('High Rating'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.swap_vert,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Sort",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Filter By Price'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RangeSlider(
                                          values: _budget,
                                          min: 0,
                                          max: 10000,
                                          divisions: 100,
                                          labels: RangeLabels(
                                            '\$ ${_budget.start.round()}',
                                            '\$ ${_budget.end.round()}',
                                          ),
                                          onChanged: (RangeValues values) {
                                            setState(() {
                                              _budget = values;
                                            });
                                          },
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Apply'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.tune,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HouseMap()), //navigate to houseMap page
                              );
                            },
                            icon: const Icon(
                              Icons.map,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Map",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const housemate()), //navigate to houseMap page
                              );
                            },
                            icon: const Icon(
                              Icons.face,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "HouseMate",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: DatabaseService.getCollectionStreamWithSorting(
                          Models.houses,
                          _sortOption,
                          _budget,
                        ),
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
                                return Column(
                                  children: [
                                    HouseInfoListView(
                                      houseName:
                                          "${docs[index]['house_name']}\n",
                                      numRating: docs[index]['rating_avg'],
                                      rating: 0,
                                      numReviews: 0,
                                      numKm: 0,
                                      numBeds: docs[index]['rooms_count'],
                                      numBath: docs[index]['bathrooms_count'],
                                      rent: docs[index]['rent_price'],
                                      isFreeElec: false,
                                    ),
                                  ],
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
