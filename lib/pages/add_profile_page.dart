import 'package:brookmate/theme/theme.dart';
import 'package:brookmate/utils/utils.dart';
import 'package:brookmate/widgets/common/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:brookmate/widgets/custom_switch_tile.dart';
import 'package:brookmate/widgets/custom_switch_tile_sex.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:brookmate/services/models/persona_model.dart';
import 'package:brookmate/pages/house_search.dart';

class AddProfilePage extends StatefulWidget {
  const AddProfilePage({super.key});

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  late DocumentReference _user;
  final Persona _persona = Persona(
    sex: "",
    cleaness: 0,
    sleepingTime: {
      "from": "",
      "to": "",
    },
    isSmoker: false,
    drinkingRate: 0,
    inviteGuests: 0,
    sociability: 0,
    canDrive: false,
    stayingSchedule: {
      "from": "",
      "to": "",
    },
    budget: {
      "from": "",
      "to": "",
    },
    nationality: Utils.nationality[0],
  );

  Map<String, dynamic> personaMap = {
    "id": 0,
    "user": null,
    "cleaness": 0,
    "sleepingTime": {
      "from": "",
      "to": "",
    }, // Map<String, String>
    "isSmoker": false,
    "drinkingRate": 0,
    "inviteGuests": 0,
    "sociability": 0,
    "canDrive": false,
    "stayingSchedule": {
      "from": "",
      "to": "",
    }, // Map<String, String>
    "sex": "unselected",
    "budget": {
      "from": "",
      "to": "",
    }, // Map<String, String>
    "nationality": Utils.nationality[0],
  };

  RangeValues _sleepTime = const RangeValues(8, 24);
  DateTime? _fromDate;
  DateTime? _toDate;
  RangeValues _budget = const RangeValues(0, 10000);
  bool isAllCriteriaMet() {
    return (_fromDate != null && _toDate != null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
          backgroundColor: AppTheme.primaryColor,
          body: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 80.0),
                  child: const Column(
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
                margin: const EdgeInsets.only(top: 100.0),
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
                          child:
                              Text('Cleaness', style: TextStyle(fontSize: 21)),
                        ),
                      ],
                    ),
                    CustomSlider(
                      min: 0,
                      max: 5,
                      divisions: 5,
                      value: personaMap["cleaness"].toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          personaMap["cleaness"] = value.toInt();
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
                          personaMap["sleepingTime"]['sleepTimeStart'] =
                              _sleepTime.start.toString();
                          personaMap["sleepingTime"]['sleepTimeEnd'] =
                              _sleepTime.end.toString();
                        });
                      },
                    ),

                    // Smoke
                    CustomSwitchTile(
                      title: 'Smoke',
                      value: personaMap["isSmoker"],
                      onChanged: (bool value) {
                        setState(() {
                          personaMap["isSmoker"] = value;
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
                      value: personaMap["drinkingRate"].toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          personaMap["drinkingRate"] = value.toInt();
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
                      value: personaMap["inviteGuests"].toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          personaMap["inviteGuests"] = value.toInt();
                        });
                      },
                    ),

                    // Sociability
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Sociability',
                              style: TextStyle(fontSize: 21)),
                        ),
                      ],
                    ),
                    Slider(
                      min: 0,
                      max: 5,
                      divisions: 5,
                      activeColor: const Color.fromARGB(255, 120, 0, 0),
                      value: personaMap["sociability"].toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          personaMap["sociability"] = value.toInt();
                        });
                      },
                    ),

                    // Drive Car
                    CustomSwitchTile(
                      title: 'Drive Car',
                      value: personaMap["canDrive"],
                      onChanged: (bool value) {
                        setState(() {
                          personaMap["canDrive"] = value;
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
                                          personaMap["stayingSchedule"]
                                                  ['fromDate'] =
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
                                          personaMap["stayingSchedule"]
                                              ['toDate'] = _toDate.toString();
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
                          //personaMap["sex"] = value;
                          personaMap["sex"] = value ? 'Female' : 'Male';
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
                          personaMap["budget"]['minimum'] =
                              _budget.start.toString();
                          personaMap["budget"]['maximum'] =
                              _budget.end.toString();
                        });
                      },
                    ),

                    // Nationality
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Nationality',
                              style: TextStyle(fontSize: 21)),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                          value: personaMap["nationality"],
                          items: Utils.nationality
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                personaMap["nationality"] = value;
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
                                  cleaness: personaMap["cleaness"],
                                  sleepingTime: personaMap["sleepingTime"],
                                  isSmoker: personaMap["isSmoker"],
                                  drinkingRate: personaMap["drinkingRate"],
                                  inviteGuests: personaMap["inviteGuests"],
                                  sociability: personaMap["sociability"],
                                  canDrive: personaMap["canDrive"],
                                  stayingSchedule:
                                      personaMap["stayingSchedule"],
                                  sex: personaMap["sex"],
                                  budget: personaMap["budget"],
                                  nationality: personaMap["nationality"]);
                              DatabaseService.addPersona(newPersona);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HouseSearch()),
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
          ])),
    );
  }
}
