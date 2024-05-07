import 'package:brookmate/pages/login_page.dart';
import 'package:brookmate/services/auth_service.dart';
import 'package:brookmate/widgets/common/custom_button.dart';
import 'package:brookmate/widgets/common/custom_input.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
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
                  label: "Name",
                  controller: nameController,
                ),
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
                CustomInput(
                  inputType: InputType.password,
                  label: "Confirm Password",
                  controller: confirmPasswordController,
                ),
                CustomButton(
                    onPressed: () async {
                      RegExp filter =
                          RegExp(r"^[a-z]+\.[a-z]+[1-9]*\@(stonybrook\.edu)");
                      String name = nameController.text;
                      String email = emailController.text.toLowerCase();
                      String password = passwordController.text;
                      String confirmPassword = confirmPasswordController.text;
                      if (filter.hasMatch(email)) {
                        if (password != confirmPassword) {
                          assert(false);
                        }
                        bool isSignedUp = await AuthService.signUpByEmail(
                            Users.tenant, name, email, password);
                        if (isSignedUp) {
                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogInPage(),
                            ),
                          );
                        }
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
