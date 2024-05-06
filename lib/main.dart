import 'package:brookmate/firebase_options.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DatabaseService.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
          stream: DatabaseService.getCollectionStream(Models.houses),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.docs);
              print("team 2 test");
              return const Text("data");
            } else {
              return const Placeholder();
            }
          }),
    );
  }
}
