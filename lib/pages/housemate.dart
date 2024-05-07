import 'dart:async';
import 'package:brookmate/widgets/housemate_profile.dart';
import 'package:brookmate/widgets/housemate_topbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:brookmate/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brookmate/services/database_service.dart';

class housemate extends StatefulWidget {
  const housemate({super.key});

  @override
  _HousemateState createState() => _HousemateState();
}

class _HousemateState extends State<housemate> {
  var imageList = [
    'assets/images/1.png',
    'assets/images/2.DNG',
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/1.png',
    'assets/images/1.png'
  ];

  changeSearchValue(value) {
    setState(() {
      searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    DatabaseService.init();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Topbar(
              friendsList: const [],
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: DatabaseService.getCollectionStreamWithSearch(
                    Models.tenants, searchValue),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var docs = snapshot.data!.docs;

                  if (docs.isEmpty) return const Text('no data');
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: docs.length,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xff9C0000),
                                                      width: 1,
                                                    ),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            imageList[index]))),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xff9C0000),
                                                    )),
                                                child: SizedBox(
                                                  height: 60,
                                                  width: 400,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: Text(
                                                      "${docs[index]['name']}\n${docs[index]['email']}\n",
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Color(0xff9C0000)),
                                                ),
                                                onPressed: null,
                                                child: Text(
                                                  'Add friend',
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                              Name: docs[index]['name'],
                              email: docs[index]['email']),
                        );
                      });
                }),
          ]),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
