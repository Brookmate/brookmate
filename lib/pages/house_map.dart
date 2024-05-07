import 'package:brookmate/pages/house_search.dart';
import 'package:flutter/material.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:brookmate/widgets/house_search_info_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HouseMap extends StatelessWidget {
  const HouseMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to HouseSearch page
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 6,
            child: Container(),
          ),
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 7.0,
                    offset: const Offset(0, -7),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
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
                              return HouseInfo2(
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
    );
  }
}
