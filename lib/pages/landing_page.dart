import 'package:brookmate/pages/login_page.dart';
import 'package:brookmate/pages/sign_up_page.dart';
import 'package:brookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Brookmate"),
                const Text("Welcome Back"),
                ElevatedButton(
                  child: const Text("Log In"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text("Sign Up"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
