import 'package:brookmate/pages/home.dart';
import 'package:brookmate/widgets/input_box.dart';
import 'package:brookmate/widgets/log_in_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _authentication = FirebaseAuth.instance;
    var userName = '';
    var userEmail = '';
    var userPassword = '';
    var userConfirm = '';

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
                      const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "John Doe"
                      ),
                      onSaved: (value) {
                        userName = value!;
                      },
                      onChanged: (value) {
                        userName = value;
                      }
                    ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "example@stonybrook.edu"
                      ),
                      onSaved: (value) {
                        userEmail = value!;
                      },
                      onChanged: (value) {
                        userEmail = value;
                      }
                    ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "**********"
                      ),
                      onSaved: (value) {
                        userPassword = value!;
                      },
                      onChanged: (value) {
                        userPassword = value;
                      },
                      obscureText: true,
                    ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "**********"
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (value != userPassword){
                          return "Enter the same password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                    ),
                      const SizedBox(
                        height: 40,
                      ),
                      const LogInSignUpButton(
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
