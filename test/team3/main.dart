import 'package:brookmate/firebase_options.dart';
import 'package:brookmate/pages/housemate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:brookmate/widgets/housemate_profile.dart';
import 'package:brookmate/widgets/housemate_topbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:brookmate/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brookmate/services/database_service.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseService.init;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: housemate(),
    );
  }
}
