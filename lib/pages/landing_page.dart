import 'package:brookmate/pages/login_page.dart';
import 'package:brookmate/pages/sign_up_page.dart';
import 'package:brookmate/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Brookmate"),
              const Text("Welcome Back"),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInPage(),
                    ),
                  );
                },
                text: "LOG IN",
                size: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
                text: "SIGN UP",
                size: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
