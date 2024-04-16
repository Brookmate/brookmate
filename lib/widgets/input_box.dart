import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String labelText;
  String? exampleText;

  InputBox({
    super.key,
    required this.labelText,
    this.exampleText,
  });

  @override
  Widget build(BuildContext context) {
    exampleText ??= labelText;
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: const TextStyle(
                  color: Color.fromARGB(255, 120, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: exampleText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
