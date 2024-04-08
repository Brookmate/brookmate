import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'house2.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
                width: 100,
              ),
              Transform.translate(
                offset: const Offset(0, 40),
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
              Container(
                //here!!!!!
                padding: const EdgeInsets.symmetric(vertical: 60),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(77, 209, 196, 196),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 15),
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
                        Row(
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
                        Row(
                          children: [
                            Icon(Icons.map),
                            Text(
                              "Map",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    House2(
                        houseName: "Strawberry House",
                        numRating: 9.9,
                        rating: 'Excellent',
                        numReviews: 1203,
                        numKm: 10,
                        numBeds: 2,
                        numBath: 1,
                        rent: 1025290,
                        isFreeElec: true),
                    SizedBox(
                      height: 10,
                    ),
                    House2(
                      houseName: 'Strawberry House',
                      numRating: 9.9,
                      rating: 'Excellent',
                      numReviews: 1203,
                      numKm: 10,
                      numBeds: 2,
                      numBath: 1,
                      rent: 1025290,
                      isFreeElec: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    House2(
                      houseName: 'Strawberry House',
                      numRating: 9.9,
                      rating: 'Excellent',
                      numReviews: 1203,
                      numKm: 10,
                      numBeds: 2,
                      numBath: 1,
                      rent: 1025290,
                      isFreeElec: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    House2(
                      houseName: 'Strawberry House',
                      numRating: 9.9,
                      rating: 'Excellent',
                      numReviews: 1203,
                      numKm: 10,
                      numBeds: 2,
                      numBath: 1,
                      rent: 1025290,
                      isFreeElec: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
