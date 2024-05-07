import 'package:brookmate/pages/house_map.dart';
import 'package:brookmate/pages/house_search.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:brookmate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DatabaseService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HouseSearch(),
    );
  }
}
