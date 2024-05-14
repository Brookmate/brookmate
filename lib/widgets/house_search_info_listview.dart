import 'package:flutter/material.dart';

class HouseInfoListView extends StatefulWidget {
  final String houseName;
  final double numRating, rating;
  final int numReviews, numBeds, numBath, rent, numKm;
  final bool isFreeElec;

  //houseInfo1
  const HouseInfoListView({
    super.key,
    required this.houseName,
    required this.numRating,
    required this.rating,
    required this.numReviews,
    required this.numKm,
    required this.numBeds,
    required this.numBath,
    required this.rent,
    required this.isFreeElec,
  });

  @override
  _HouseInfoListViewState createState() => _HouseInfoListViewState();
}

class _HouseInfoListViewState extends State<HouseInfoListView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Flexible(
            flex: 3,
            child: Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
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
                        Text(widget.houseName,
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
                                '${widget.numRating}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text("$widget.rating",
                                style:
                                    const TextStyle(fontSize: 10, height: 0.8)),
                            Text(' - ${widget.numReviews} reviews',
                                style:
                                    const TextStyle(fontSize: 10, height: 0.8))
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: isFavorite ? Colors.pink : Colors.black,
                        size: 40,
                      ),
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
                      '${widget.numKm} km from School',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.numBeds} beds - ${widget.numBath} bathrooms',
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
                      '1 month: KRW ${widget.rent}',
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
