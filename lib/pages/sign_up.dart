import 'home.dart';
import '../widgets/input_box.dart';
import '../widgets/log_in_sign_up_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signUpPage extends StatelessWidget {
  const signUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 120, 0, 0),
        body: Container(
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
                        'Sign-Up',
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
                      inputBox(
                        labelText: 'Name',
                        exampleText: 'John Doe',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputBox(
                        labelText: 'Email',
                        exampleText: 'john.doe@stonybrook.edu',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputBox(
                        labelText: 'Password',
                        exampleText: '************',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputBox(
                        labelText: 'Confirm Password',
                        exampleText: '************',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const logInSignUpButton(
                        isLogIn: false,
                        connectedPage: HomePage(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
