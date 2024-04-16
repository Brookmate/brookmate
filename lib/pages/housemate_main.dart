import 'package:brookmate/widgets/housemate_profile.dart';
import 'package:brookmate/widgets/housemate_topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Housemate',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,

        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(152, 4, 4, 100)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? searchValue;

  var nameList = [
    "Sid",
    "Heejoon",
    "GeonO",
    "Minhyeok",
    "Jinsung",
    "blah",
  ];

  var imageList = [
    'assets/images/1.png',
    'assets/images/2.DNG',
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/1.png',
    'assets/images/1.png'
  ];

  var description = [
    ['male', '21', 'blah'],
    ['female', '20', 'blah'],
    ['male', '25', 'blah'],
    ['female', '135', 'blah'],
    ['male', '125', 'blah'],
    ['undefined', '123', 'blah']
  ];

  @override
  Widget build(BuildContext context) {
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
            topbar(),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  image: AssetImage(
                                                      imageList[index]))),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                width: 1,
                                                color: const Color(0xff9C0000),
                                              )),
                                          child: SizedBox(
                                            height: 60,
                                            width: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                "${nameList[index]}\n${description[index][0]}\n${description[index][1]}",
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                      gender: description[index][0],
                      age: description[index][1],
                      Name: nameList[index],
                    ),
                  );
                }),
          ]),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
