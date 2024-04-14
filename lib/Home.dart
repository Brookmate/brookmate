import 'package:brookmate/Widget/logInSignUpButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'signUp.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 120, 0, 0),
        body: Column(
          children: [
            const SizedBox(
              height: 170,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to \nBrookmate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 180,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 50,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      logInSignUpButton(
                        isLogIn: true,
                        connectedPage: LoginPage(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      logInSignUpButton(
                        isLogIn: false,
                        connectedPage: signUpPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
