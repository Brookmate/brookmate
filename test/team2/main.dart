import 'package:flutter/material.dart';
import 'package:brookmate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddProfilePage(),
    );
  }
}

class AddProfilePage extends StatefulWidget {
  const AddProfilePage({super.key});

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  // 여기에 상태 관리 변수 추가
  bool _drinksAlcohol = false;
  bool _drivesCar = false;
  double _sociability = 0;
  bool _food = false;
  bool _foodSharing = false;
  double _cleaness = 0;
  double _noiseLevel = 0;
  bool _petOwnership = false;
  DateTime? _fromDate;
  DateTime? _toDate;
  bool _smokes = false;
  RangeValues _sleepTime = const RangeValues(8, 24);
  bool _guest = false;
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
  String? _selectedNationality;
  RangeValues _budget = const RangeValues(0, 10000);
  bool _sex = false;

  //Next Page
  // Function to check if all criteria are met
  bool isAllCriteriaMet() {
    if ((_fromDate != null) &&
        (_toDate != null) &&
        (_selectedNationality != null)) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter your profile',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          // Drink Alcohol
          customSwitchTile(
            'Drink Alcohol',
            _drinksAlcohol,
            (bool value) {
              setState(() {
                _drinksAlcohol = value;
              });
            },
          ),

          // Drive Car
          customSwitchTile(
            'Drive Car',
            _drivesCar,
            (bool value) {
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
            activeColor: Color.fromARGB(255, 120, 0, 0),
            value: _sociability,
            onChanged: (double value) {
              setState(() {
                _sociability = value;
              });
            },
          ),

          // Food
          customSwitchTileFood(
            'Food',
            _food,
            (bool value) {
              setState(() {
                _food = value;
              });
            },
          ),

          // Food Sharing
          customSwitchTile(
            'Food Sharing',
            _foodSharing,
            (bool value) {
              setState(() {
                _foodSharing = value;
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
            activeColor: Color.fromARGB(255, 120, 0, 0),
            value: _cleaness,
            onChanged: (double value) {
              setState(() {
                _cleaness = value;
              });
            },
          ),

          // Noise Level
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Noise Level', style: TextStyle(fontSize: 21)),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 100,
            divisions: 10, // 10점 단위로 조절
            activeColor: Color.fromARGB(255, 120, 0, 0),
            value: _noiseLevel,
            onChanged: (double value) {
              setState(() {
                _noiseLevel = value;
              });
            },
          ),

          // Pet Ownership
          customSwitchTile(
            'Pet Ownership',
            _petOwnership,
            (bool value) {
              setState(() {
                _petOwnership = value;
              });
            },
          ),

          // Staying Schedule
          // TO DO: 날짜 넣기
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
                              lastDate: DateTime(
                                  2025), //일단 2025로 설정. 지금으로부터 1년까지 허용하기
                            ).then((selectedDate) {
                              setState(() {
                                _fromDate = selectedDate;
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
                              lastDate: DateTime(
                                  2025), //일단 2025로 설정. 지금으로부터 1년까지 허용하기
                            ).then((selectedDate) {
                              setState(() {
                                _toDate = selectedDate;
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
          customSwitchTile(
            'Smoke',
            _smokes,
            (bool value) {
              setState(() {
                _smokes = value;
              });
            },
          ),

          // Sleeping Time
          // 지금은 수면시간을 체크하는 일방향 슬라이더입니다!! Guest 파트 전까지 지우고 새로 짜셔야 할거에요
          // TO DO: Range Slider(혹은 다른 방법) 이용해서 양쪽에서 조절 가능하도록 만들기
          //        현재 상태 나타내는 말풍선 슬라이더 밑에 달기
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
            activeColor: Color.fromARGB(255, 120, 0, 0),
            onChanged: (RangeValues values) {
              setState(() {
                _sleepTime = values;
              });
            },
          ),

          // Guest
          customSwitchTile(
            'Guest',
            _guest,
            (bool value) {
              setState(() {
                _guest = value;
              });
            },
          ),

          // Nationality
          // TO DO: 전세계 국가 중에서 선택할 수 있도록 만들기
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
                  setState(() {
                    _selectedNationality = value!;
                  });
                },
              ),
            ],
          ),

          // Budget
          // TO DO: Range Slider(혹은 다른 방법) 이용해서 양쪽에서 조절 가능하도록 만들기
          //        현재 상태 나타내는 말풍선 슬라이더 밑에 달기
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
              });
            },
          ),

          // Sex
          customSwitchTileSex(
            'Sex',
            _sex,
            (bool value) {
              setState(() {
                _sex = value;
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
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customSwitchTile(String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value ? 'Yes' : 'No'), // Keep text color unchanged
          Switch.adaptive(
            value: value,
            activeColor: Colors
                .red, // Change the background color of the "Check" circle to red
            onChanged: onChanged,
          ),
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }

  Widget customSwitchTileFood(
      String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value ? 'Outdoor' : 'Indoor'), // Keep text color unchanged
          Switch.adaptive(
            value: value,
            activeColor: Colors
                .red, // Change the background color of the "Check" circle to red
            onChanged: onChanged,
          ),
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }

  Widget customSwitchTileSex(
      String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value ? 'Female' : 'Male'), // Keep text color unchanged
          Switch.adaptive(
            value: value,
            activeColor: Colors
                .red, // Change the background color of the "Check" circle to red
            onChanged: onChanged,
          ),
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Text('This is the next page.'),
      ),
    );
  }
}
