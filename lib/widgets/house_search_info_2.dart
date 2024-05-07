import 'package:flutter/material.dart';

class HouseInfo2 extends StatefulWidget {
  final String houseName;
  final double numRating, rating;
  final int numReviews, numBeds, numBath, rent, numKm;
  final bool isFreeElec;

  const HouseInfo2({
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
  _HouseInfo2State createState() => _HouseInfo2State();
}

class _HouseInfo2State extends State<HouseInfo2> {
  bool isFavorite = false;

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
                          Text(widget.houseName,
                              style:
                                  const TextStyle(fontSize: 20, height: 1.1)),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(3)),
                                padding: const EdgeInsets.all(2),
                                child: Text('${widget.numRating}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    )),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text("${widget.rating}",
                                  style: const TextStyle(
                                      fontSize: 10, height: 0.8)),
                              Text(' - ${widget.numReviews} reviews',
                                  style: const TextStyle(
                                      fontSize: 10, height: 0.8))
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
                      '${widget.numKm} km from School',
                      style: const TextStyle(fontSize: 13),
                    )
                  ],
                ),
                widget.isFreeElec
                    ? Text(
                        '${widget.numBeds} beds, ${widget.numBath} bathrooms, free electricity',
                        style: const TextStyle(fontSize: 13, height: 1.4),
                        softWrap: true,
                      )
                    : Text(
                        '${widget.numBeds} beds, ${widget.numBath} bathrooms',
                        softWrap: true,
                      ),
                Text('1 month: KRW ${widget.rent}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
