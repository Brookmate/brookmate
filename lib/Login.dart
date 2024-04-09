import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 120, 0, 0),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Row(
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
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "SBU Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                        )
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}