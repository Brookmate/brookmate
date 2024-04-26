import "package:brookmate/firebase_options.dart";
import "package:brookmate/services/database_service.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DatabaseService.init();
  runApp(const DBTest());
}

class DBTest extends StatefulWidget {
  const DBTest({super.key});

  @override
  State<DBTest> createState() => _DBTestState();
}

class _DBTestState extends State<DBTest> {
  @override
  Widget build(BuildContext context) {
    late final houses = DatabaseService.getCollectionStream(Models.houses);

    return const MaterialApp(
        home: Scaffold(
      body: Column(),
    ));
  }
}
