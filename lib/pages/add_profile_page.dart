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
  Future<void> getUserByEmail(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('tenants')
              .where('email', isEqualTo: email)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        Tenant tenant = Tenant.fromDocumentSnapshot(querySnapshot.docs.first);

        _user = FirebaseFirestore.instance.collection('users').doc(tenant.id);
      } else {}
    } catch (error) {
      print('Error getting user by email: $error');
    }
  }

  
  int _cleaness = 0;
  RangeValues _sleepTime = const RangeValues(8, 24);
  final Map<String, String> _sleepTimeMap = {};
  bool _smokes = false;
  int _drinksAlcohol = 0;
  int _guest = 0;
  int _sociability = 0;
  bool _drivesCar = false;
  DateTime? _fromDate;
  DateTime? _toDate;
  bool _fromDateIsSelected = false;
  bool _toDateIsSelected = false;
  final Map<String, String> _scheduleMap = {};
  bool _sex = false;
  String _selectedSex = 'unselected';
  RangeValues _budget = const RangeValues(0, 10000);
  final Map<String, String> _budgetMap = {};
  final _nationality = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo, Democratic Republic of the',
    'Congo, Republic of the',
    'Costa Rica',
    "Cote d'Ivoire",
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor (Timor-Leste)',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea, North',
    'Korea, South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar (Burma)',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia (Macedonia)',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];
  String _selectedNationality = 'unselected';
  bool _nationalityIsSelected = false;
  // final DatabaseService _dbService = DatabaseService();

  // Next Page
  // Function to check if all criteria are met
  bool isAllCriteriaMet() {
    return (_fromDateIsSelected && _toDateIsSelected && _nationalityIsSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter your persona',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          // Drink Alcohol
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Drink Alcohol', style: TextStyle(fontSize: 21)),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 100,
            divisions: 20, // 10점 단위로 조절
            activeColor: Colors.red,
            value: _drinksAlcohol.toDouble(),
            onChanged: (double value) {
              setState(() {
                _drinksAlcohol = value.toInt();
              });
            },
          ),

          // Drive Car
          CustomSwitchTile(
            title: 'Drive Car',
            value: _drivesCar,
            onChanged: (bool value) {
              setState(() {
                _drivesCar = value;
              });
            },
          ),

          // Sociability
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Sociability', style: TextStyle(fontSize: 21)),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 100,
            divisions: 10, // 10점 단위로 조절
            activeColor: Colors.red,
            value: _sociability.toDouble(),
            onChanged: (double value) {
              setState(() {
                _sociability = value.toInt();
              });
            },
          ),

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
            max: 100,
            divisions: 10,
            activeColor: Colors.red,
            value: _cleaness.toDouble(),
            onChanged: (double value) {
              setState(() {
                _cleaness = value.toInt();
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
                    Text('Staying Schedule', style: TextStyle(fontSize: 21)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('From  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21)),
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
                                _fromDateIsSelected = true;
                                _scheduleMap["from"] = _fromDate.toString();
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
                                fontWeight: FontWeight.bold, fontSize: 21)),
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
                                _toDateIsSelected = true;
                                _scheduleMap["to"] = _toDate.toString();
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

          // Smoke
          CustomSwitchTile(
            title: 'Smoke',
            value: _smokes,
            onChanged: (bool value) {
              setState(() {
                _smokes = value;
              });
            },
          ),

          // Sleeping Time
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Sleeping Time', style: TextStyle(fontSize: 21)),
              ),
            ],
          ),
          RangeSlider(
            values: _sleepTime,
            min: 8,
            max: 24,
            divisions: 16, // 슬라이더 간격
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
            activeColor: Colors.red,
            onChanged: (RangeValues values) {
              setState(() {
                _sleepTime = values;
                _sleepTimeMap["from"] = _sleepTime.start.toString();
                _sleepTimeMap["to"] = _sleepTime.end.toString();
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
            max: 100,
            divisions: 20, // 10점 단위로 조절
            activeColor: Colors.red,
            value: _guest.toDouble(),
            onChanged: (double value) {
              setState(() {
                _guest = value.toInt();
              });
            },
          ),

          // Nationality
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Nationality', style: TextStyle(fontSize: 21)),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: _selectedNationality,
                items: _nationality
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedNationality = value;
                      _nationalityIsSelected = true;
                    });
                  }
                },
              ),
            ],
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
            activeColor: Colors.red,
            onChanged: (RangeValues values) {
              setState(() {
                _budget = values;
                _budgetMap["from"] = _budget.start.toString();
                _budgetMap["to"] = _budget.end.toString();
              });
            },
          ),

          CustomSwitchTileSex(
            title: 'Sex',
            value: _sex,
            onChanged: (bool value) {
              setState(() {
                _sex = value;
                _selectedSex = _sex ? 'Female' : 'Male';
              });
            },
          ),

          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(45.0),
                child: Text('', style: TextStyle(fontSize: 21)),
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
                        user: _user,
                        cleaness: _cleaness,
                        sleepingTime: _sleepTimeMap,
                        isSmoker: _smokes,
                        drinkingRate: _drinksAlcohol,
                        inviteGuests: _guest,
                        sociability: _sociability,
                        canDrive: _drivesCar,
                        stayingSchedule: _scheduleMap,
                        sex: _selectedSex,
                        budget: _budgetMap,
                        nationality: _selectedNationality);
                    DatabaseService.addPersona(newPersona);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NextPage()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    // Change button color to red if all criteria are met, otherwise keep it grey
                    return isAllCriteriaMet() ? Colors.red : Colors.grey;
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
    );
  }
}
