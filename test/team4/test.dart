import 'package:brookmate/pages/house_map.dart';
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
    return MaterialApp(
      home: HouseMap(),
    );
  }
}
