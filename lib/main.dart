import 'package:brookmate/firebase_options.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    late final houses = DatabaseService.getCollectionSnapshot(Models.houses);
    return const MaterialApp(
      home: Placeholder(),
    );
  }
}
