import 'package:brookmate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:brookmate/widgets/custom_switch_tile.dart';
import 'package:brookmate/widgets/custom_switch_tile_sex.dart';
import 'package:brookmate/pages/next_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:brookmate/services/models/persona_model.dart';
import 'package:brookmate/services/models/tenant_model.dart';

class AddProfilePage extends StatefulWidget {
  const AddProfilePage({super.key});

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  // 상태 관리 변수들
  late DocumentReference _user;
  // email을 기준으로 사용자를 검색하여 _user에 할당하는 함수
  // Future<void> getUserByEmail(String email) async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection('tenants')
  //             .where('email', isEqualTo: email)
  //             .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       Tenant tenant = Tenant.fromDocumentSnapshot(querySnapshot.docs.first);

  //       _user = FirebaseFirestore.instance.collection('users').doc(tenant.id);
  //     } else {}
  //   } catch (error) {
  //     print('Error getting user by email: $error');
  //   }
  // }

  Map<String, dynamic> varMap = {
    "id": 0,
    "user": null,
    "cleaness": 0,
    "sleepingTime": {
      'sleepTimeStart': 'value1',
      'sleepTimeEnd': 'value2'
    }, // Map<String, String>
    "isSmoker": false,
    "drinkingRate": 0,
    "inviteGuests": 0,
    "sociability": 0,
    "canDrive": false,
    "stayingSchedule": {
      'fromDate': 'value1',
      'toDate': 'value2'
    }, // Map<String, String>
    "sex": 'unselected',
    "budget": {'minimum': 'value1', 'maximum': 'value2'}, // Map<String, String>
    "nationality": Utils.nationality[0],
  };

  RangeValues _sleepTime = const RangeValues(8, 24);
  DateTime? _fromDate;
  DateTime? _toDate;
  //bool _fromDateIsSelected = false;
  //bool _toDateIsSelected = false;
  //bool _selectedSex = false;
  RangeValues _budget = const RangeValues(0, 10000);
  //final _nationality = Utils.nationality;
  //bool _nationalityIsSelected = false;

  // Next Page
  // Function to check if all criteria are met
  bool isAllCriteriaMet() {
    // return (_fromDateIsSelected && _toDateIsSelected);
    return (_fromDate != null && _toDate != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 120, 0, 0),
        body: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                height: 100,
                margin: EdgeInsets.only(top: 80.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  Enter your persona',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
            Container(
              height: 700,
              margin: EdgeInsets.only(top: 100.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
              ),
              child: ListView(
                children: [
                  // Cleaness
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Cleaness', style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    activeColor: const Color.fromARGB(255, 120, 0, 0),
                    value: varMap["cleaness"].toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        varMap["cleaness"] = value.toInt();
                      });
                    },
                  ),

                  // Sleeping Time
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Sleeping Time',
                            style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: _sleepTime,
                    min: 0,
                    max: 24,
                    divisions: 24, // 슬라이더 간격
                    labels: RangeLabels(
                      (_sleepTime.start < 12
                          ? "${_sleepTime.start.round().toString()} PM"
                          : _sleepTime.start == 12
                              ? "${_sleepTime.start.round().toString()} AM"
                              : _sleepTime.start == 24
                                  ? "${_sleepTime.start.round() - 12} PM"
                                  : "${_sleepTime.start.round() - 12} AM"),
                      (_sleepTime.end < 12
                          ? "${_sleepTime.end.round().toString()} PM"
                          : _sleepTime.end == 12
                              ? "${_sleepTime.end.round().toString()} AM"
                              : _sleepTime.end == 24
                                  ? "${_sleepTime.end.round() - 12} PM"
                                  : "${_sleepTime.end.round() - 12} AM"),
                    ),
                    activeColor: const Color.fromARGB(255, 120, 0, 0),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _sleepTime = values;
                        varMap["sleepingTime"]['sleepTimeStart'] =
                            _sleepTime.start.toString();
                        varMap["sleepingTime"]['sleepTimeEnd'] =
                            _sleepTime.end.toString();
                      });
                    },
                  ),

                  // Smoke
                  CustomSwitchTile(
                    title: 'Smoke',
                    value: varMap["isSmoker"],
                    onChanged: (bool value) {
                      setState(() {
                        varMap["isSmoker"] = value;
                      });
                    },
                  ),

                  // Drink Alcohol
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Drink Alcohol',
                            style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    activeColor: const Color.fromARGB(255, 120, 0, 0),
                    value: varMap["drinkingRate"].toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        varMap["drinkingRate"] = value.toInt();
                      });
                    },
                  ),

                  // Guest
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Guest', style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    activeColor: const Color.fromARGB(255, 120, 0, 0),
                    value: varMap["inviteGuests"].toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        varMap["inviteGuests"] = value.toInt();
                      });
                    },
                  ),

                  // Sociability
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child:
                            Text('Sociability', style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    activeColor: const Color.fromARGB(255, 120, 0, 0),
                    value: varMap["sociability"].toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        varMap["sociability"] = value.toInt();
                      });
                    },
                  ),

                  // Drive Car
                  CustomSwitchTile(
                    title: 'Drive Car',
                    value: varMap["canDrive"],
                    onChanged: (bool value) {
                      setState(() {
                        varMap["canDrive"] = value;
                      });
                    },
                  ),

                  // Staying Schedule
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Staying Schedule',
                                style: TextStyle(fontSize: 21)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text('From  ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21)),
                                ElevatedButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2026),
                                    ).then((selectedDate) {
                                      setState(() {
                                        _fromDate = selectedDate;
                                        //_fromDateIsSelected = true;
                                        varMap["stayingSchedule"]['fromDate'] =
                                            _fromDate.toString();
                                      });
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  child: Text(
                                      _fromDate != null
                                          ? _fromDate.toString().split(" ")[0]
                                          : "unselected",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text('To  ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21)),
                                ElevatedButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: _fromDate,
                                      firstDate: _fromDate ?? DateTime.now(),
                                      lastDate: DateTime(2026),
                                    ).then((selectedDate) {
                                      setState(() {
                                        _toDate = selectedDate;
                                        //_toDateIsSelected = true;
                                        varMap["stayingSchedule"]['toDate'] =
                                            _toDate.toString();
                                      });
                                    });
                                  },
                                  child: Text(
                                      _toDate != null
                                          ? _toDate.toString().split(" ")[0]
                                          : "unselected",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // sex
                  CustomSwitchTileSex(
                    title: 'Sex',
                    value: false,
                    onChanged: (bool value) {
                      setState(() {
                        //varMap["sex"] = value;
                        varMap["sex"] = value ? 'Female' : 'Male';
                      });
                    },
                  ),

                  // Budget
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Budget', style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: _budget,
                    min: 0,
                    max: 10000,
                    divisions: 100, // 슬라이더 간격
                    labels: RangeLabels(
                      "\$ ${_budget.start.round()}",
                      "\$ ${_budget.end.round()}",
                    ),
                    activeColor: const Color.fromARGB(255, 120, 0, 0),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _budget = values;
                        varMap["budget"]['minimum'] = _budget.start.toString();
                        varMap["budget"]['maximum'] = _budget.end.toString();
                      });
                    },
                  ),

                  // Nationality
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child:
                            Text('Nationality', style: TextStyle(fontSize: 21)),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        value: varMap["nationality"],
                        items: Utils.nationality
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              varMap["nationality"] = value;
                              //_nationalityIsSelected = true;
                            });
                          }
                        },
                      ),
                    ],
                  ),

                  // Next Button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the next page if all criteria are met
                          if (isAllCriteriaMet()) {
                            // DocumentSnapshot userSnapshot = Tenant.fromDocumentSnapshot(FirebaseFirestore.instance.collection(Models.tenants).doc("email").get());
                            // if (userSnapshot.exists) {
                            // }
                            Persona newPersona = Persona(
                                cleaness: varMap["cleaness"],
                                sleepingTime: varMap["sleepingTime"],
                                isSmoker: varMap["isSmoker"],
                                drinkingRate: varMap["drinkingRate"],
                                inviteGuests: varMap["inviteGuests"],
                                sociability: varMap["sociability"],
                                canDrive: varMap["canDrive"],
                                stayingSchedule: varMap["stayingSchedule"],
                                sex: varMap["sex"],
                                budget: varMap["budget"],
                                nationality: varMap["nationality"]);
                            DatabaseService.addPersona(newPersona);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NextPage()),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            // Change button color to red if all criteria are met, otherwise keep it grey
                            return isAllCriteriaMet()
                                ? const Color.fromARGB(255, 120, 0, 0)
                                : Colors.grey;
                          }),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]))
        ]));
  }
}
