import 'package:brookmate/widgets/common/custom_button.dart';
import 'package:brookmate/widgets/common/custom_input.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          const Text("Welcome to\nBrookmate"),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                CustomInput(
                  inputType: InputType.email,
                  label: "Email",
                  controller: emailController,
                ),
                CustomInput(
                  inputType: InputType.password,
                  label: "Password",
                  controller: passwordController,
                ),
                CustomButton(
                    onPressed: () {
                      RegExp filter =
                          RegExp(r"^[a-z]+\.[a-z]+[1-9]*\@(stonybrook\.edu)");
                      String email = emailController.text.toLowerCase();
                      String password = passwordController.text;
                      if (filter.hasMatch(email)) {
                        print("$email $password");
                      } else {
                        print("Invalid email address");
                      }
                      // AuthService.logInByEmail(email, password);
                    },
                    size: 300,
                    text: "Submit")
              ],
            ),
          )
        ],
      ),
    );
  }
}
