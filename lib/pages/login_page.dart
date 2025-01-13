import 'package:brookmate/pages/add_profile_page.dart';
import 'package:brookmate/pages/owner_page.dart';
import 'package:brookmate/services/auth_service.dart';
import 'package:brookmate/theme/theme.dart';
import 'package:brookmate/utils/utils.dart';
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

    void onSubmit() async {
      RegExp filter = RegExp(r"^[a-z]+\.[a-z]+[1-9]*\@(stonybrook\.edu)");
      String email = emailController.text.toLowerCase();
      String password = passwordController.text;
      if (filter.hasMatch(email)) {
        try {
          await AuthService.logInByEmail(email, password);
        } catch (e) {
          if (!context.mounted) return;
          Utils.showAlertDialog(context, "Log In failed", "Please try again.");
          return;
        }
        Users userType = Users.tenant; // temporary default
        if (!context.mounted) return;
        switch (userType) {
          case Users.owner:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OwnerPage(),
              ),
            );
            break;
          default:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProfilePage(),
              ),
            );
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
                  TextField(
                    cursorColor: AppTheme.primaryColor,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    cursorColor: AppTheme.primaryColor,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text("Log In"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
