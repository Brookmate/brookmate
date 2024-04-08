import 'package:flutter/material.dart';

void main() {
  runApp(const SignAndLog());
}

class SignAndLog extends StatefulWidget {
  const SignAndLog({super.key});

  @override
  State<SignAndLog> createState() => _SignAndLogState();
}

class _SignAndLogState extends State<SignAndLog> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //rgb(255,255,255)
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              const Icon(
                Icons.square,
                color: Color.fromARGB(255, 176, 29, 20),
                size: 180,
              ),
              const Text(
                'Brookmate',
                style: TextStyle(
                  color: Color.fromARGB(255, 176, 29, 20),
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 176, 29, 20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
