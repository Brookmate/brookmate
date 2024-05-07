import 'package:flutter/material.dart';

enum InputType { email, password, text }

class CustomInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final InputType inputType;
  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    required this.inputType,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.inputType == InputType.password ? true : false,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff9C0000),
          ),
        ),
        labelText: widget.label,
      ),
    );
  }
}
