import 'home.dart';
import 'package:brookmate/widgets/input_box.dart';
import 'package:brookmate/widgets/log_in_sign_up_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 0, 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    InputBox(labelText: 'SBU Email'),
                    const SizedBox(
                      height: 60,
                    ),
                    InputBox(labelText: 'SBU Password'),
                    const SizedBox(
                      height: 80,
                    ),
                    const LogInSignUpButton(
                      isLogIn: true,
                      connectedPage: HomePage(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
