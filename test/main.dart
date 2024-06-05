import "package:brookmate/widgets/common/custom_input.dart";
import "package:flutter/material.dart";
import "package:brookmate/theme/theme.dart";

Future<void> main() async {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme, // Use the theme from theme.dart
      home: Scaffold(
        body: Column(
          children: [
            CustomInput(
              label: "label",
              controller: TextEditingController(),
              inputType: InputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
