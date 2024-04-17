import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String Name;
  final String gender;
  final String age;
  final String image;
  final String? blah;

  const Profile(
      {super.key,
      required this.gender,
      required this.age,
      required this.Name,
      required this.image,
      this.blah});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff9C0000),
                    width: 1,
                  ),
                  image: DecorationImage(image: AssetImage(image))),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xff9C0000),
                  )),
              child: SizedBox(
                height: 60,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "$Name\n$gender\n$age",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
