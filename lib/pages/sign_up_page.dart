import 'package:brookmate/pages/login_page.dart';
import 'package:brookmate/services/auth_service.dart';
import 'package:brookmate/theme/theme.dart';
import 'package:brookmate/utils/utils.dart';
import 'package:brookmate/widgets/common/custom_toggle.dart';
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
    List<bool> toggleController = [true, false];

    void onSubmit() async {
      RegExp filter = RegExp(r"^[a-z]+\.[a-z]+[1-9]*\@(stonybrook\.edu)");
      Users userType = toggleController[0] ? Users.tenant : Users.owner;
      String name = nameController.text;
      String email = emailController.text.toLowerCase();
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;
      if (filter.hasMatch(email)) {
        if (password != confirmPassword) {
          assert(false);
        }
        bool isSignedUp =
            await AuthService.signUpByEmail(userType, name, email, password);
        if (!context.mounted) return;
        if (isSignedUp) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInPage(),
            ),
          );
        } else {
          Utils.showAlertDialog(context, "Sign Up failed", "Please try again.");
        }
      } else {
        Utils.showAlertDialog(context, "Invalid Email",
            "Please enter a valid SBU email address.");
      }
    }

    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Column(
          children: [
            const Text("Welcome to\nBrookmate"),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(color: AppTheme.primaryColor),
                      ),
                      CustomToggle(
                        left: "Tenant",
                        right: "Owner",
                        controller: toggleController,
                      ),
                    ],
                  ),
                  TextField(
                    cursorColor: AppTheme.primaryColor,
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  TextField(
                    cursorColor: AppTheme.primaryColor,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    cursorColor: AppTheme.primaryColor,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    cursorColor: AppTheme.primaryColor,
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text("Sign Up"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
