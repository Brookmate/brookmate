import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseInfo2 extends StatelessWidget {
  final String houseName, rating;
  final double numRating;
  final int numReviews, numBeds, numBath, rent, numKm;
  final bool isFreeElec;

  const HouseInfo2(
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

  final _greyColor = const Color.fromRGBO(206, 206, 206, 100);

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
              //color: Colors.grey,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[350],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    //하트 기준으로 좌우 나누기
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // strqevrry, excellent 기준 상하로 나누기
                        children: [
                          Text(houseName,
                              style:
                                  const TextStyle(fontSize: 20, height: 1.1)),
                          Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: _greyColor,
                                  borderRadius: BorderRadius.circular(3)),
                              padding: const EdgeInsets.all(2),
                              child: Text('$numRating',
                                  style: const TextStyle(
                                    fontSize: 10,
                                  )),
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
                          ])
                        ],
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 45,
                      ),
                    ]),
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
                      )
                    ]),
                isFreeElec
                    ? Text(
                        '$numBeds beds, $numBath bathrooms, free electricity',
                        style: const TextStyle(fontSize: 13, height: 1.4),
                        softWrap: true,
                      )
                    : Text(
                        '$numBeds beds, $numBath bathrooms',
                        softWrap: true,
                      ),
                Text('1 month: KRW $rent')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
