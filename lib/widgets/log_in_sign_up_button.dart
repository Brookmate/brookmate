import 'package:flutter/material.dart';

class logInSignUpButton extends StatelessWidget {
  final bool isLogIn;
  final String buttonText;
  final Widget connectedPage;

  const logInSignUpButton({
    super.key,
    required this.isLogIn,
    required this.connectedPage,
  }) : buttonText = isLogIn ? 'Log-In' : 'Sign-Up';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 120, 0, 0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(255, 120, 0, 0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => connectedPage));
        },
      ),
    );
  }
}
