import 'package:flutter/material.dart';
import 'package:brookmate/widgets/housemate_profile.dart';

class housemate_listview extends StatelessWidget {
  const housemate_listview({
    super.key,
    required this.nameList,
    required this.imageList,
    required this.emailList,
    required this.friendsList,
  });

  final List<String> nameList;
  final List<String> imageList;
  final List<String> emailList;
  final List<String> friendsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: nameList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  constraints: const BoxConstraints(
                    maxWidth: double.infinity,
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      image: DecorationImage(
                                          image: AssetImage(imageList[index]))),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
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
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "${nameList[index]}\n${emailList[index][1]}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff9C0000)),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    // add driend 누르면 frindsList append돼야함 'friendsList'
                                    'Add friend',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Profile(
              image: imageList[index],
              email: emailList[index],
              Name: nameList[index],
            ),
          );
        });
  }
}
