import 'package:flutter/material.dart';
import 'package:brookmate/widgets/custom_switch_tile.dart';
import 'package:brookmate/widgets/custom_switch_tile_food.dart';
import 'package:brookmate/widgets/custom_switch_tile_sex.dart';
import 'package:brookmate/pages/next_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  // 상태 관리 변수들
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

  // Next Page
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
          CustomSwitchTile(
            title: 'Drink Alcohol',
            value: _drinksAlcohol,
            onChanged: (bool value) {
              setState(() {
                _drinksAlcohol = value;
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
            value: _sociability,
            onChanged: (double value) {
              setState(() {
                _sociability = value;
              });
            },
          ),

          // Food
          CustomSwitchTileFood(
            title: 'Food',
            value: _food,
            onChanged: (bool value) {
              setState(() {
                _food = value;
              });
            },
          ),

          // Food Sharing
          CustomSwitchTile(
            title: 'Food Sharing',
            value: _foodSharing,
            onChanged: (bool value) {
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
            activeColor: Colors.red,
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
            activeColor: Colors.red,
            value: _noiseLevel,
            onChanged: (double value) {
              setState(() {
                _noiseLevel = value;
              });
            },
          ),

          // Pet Ownership
          CustomSwitchTile(
            title: 'Pet Ownership',
            value: _petOwnership,
            onChanged: (bool value) {
              setState(() {
                _petOwnership = value;
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
              });
            },
          ),

          // Guest
          CustomSwitchTile(
            title: 'Guest',
            value: _guest,
            onChanged: (bool value) {
              setState(() {
                _guest = value;
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
                  setState(() {
                    _selectedNationality = value!;
                  });
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
              });
            },
          ),

          // Sex
          CustomSwitchTileSex(
            title: 'Sex',
            value: _sex,
            onChanged: (bool value) {
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
