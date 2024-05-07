import 'package:brookmate/firebase_options.dart';
import 'package:brookmate/pages/landing_page.dart';
import 'package:brookmate/services/auth_service.dart';
import 'package:brookmate/services/database_service.dart';
import 'package:brookmate/utils/prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DatabaseService.init();
  await AuthService.init();
  await Prefs.init();
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
    return const MaterialApp(
      home: LandingPage(),
    );
  }
}
