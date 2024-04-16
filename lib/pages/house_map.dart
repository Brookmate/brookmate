import 'package:flutter/material.dart';
import '../widgets/house_search_info_2.dart';

class HouseMap extends StatelessWidget {
  final houseList = [
    "Kiwi",
    "StrawBerry",
    "Lemon",
    "Apple",
    "Watermelon",
    "Mango",
  ];

  HouseMap({super.key});
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[300],
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
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: houseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HouseInfo2(
                            houseName: houseList[index],
                            numRating: 9.9,
                            rating: 'Excellent',
                            numReviews: 1203,
                            numKm: 10,
                            numBeds: 2,
                            numBath: 1,
                            rent: 1025290,
                            isFreeElec: true,
                          );
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
