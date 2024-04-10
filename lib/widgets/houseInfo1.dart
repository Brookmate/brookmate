import 'package:flutter/material.dart';

class HouseInfo1 extends StatelessWidget {
  final String houseName, rating;
  final double numRating;
  final int numReviews, numBeds, numBath, rent, numKm;
  final bool isFreeElec;

  const HouseInfo1(
      {super.key,
      required this.houseName,
      required this.numRating,
      required this.rating,
      required this.numReviews,
      required this.numKm,
      required this.numBeds,
      required this.numBath,
      required this.rent,
      required this.isFreeElec});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(houseName,
                            style: const TextStyle(fontSize: 25, height: 1.1)),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  borderRadius: BorderRadius.circular(3)),
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                '$numRating',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(rating,
                                style:
                                    const TextStyle(fontSize: 10, height: 0.8)),
                            Text(' - $numReviews reviews',
                                style:
                                    const TextStyle(fontSize: 10, height: 0.8))
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 15,
                      ),
                      Text(
                        'New york',
                        style: TextStyle(fontSize: 13),
                      ),
                    ]),
                    Text(
                      '$numKm km from School',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$numBeds beds - $numBath bathrooms',
                      style: const TextStyle(fontSize: 13, height: 1.4),
                      softWrap: true,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'free electricity',
                      textAlign: TextAlign.end,
                      softWrap: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '1 month: KRW $rent',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
