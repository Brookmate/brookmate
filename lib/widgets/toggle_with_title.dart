import 'package:brookmate/widgets/common/custom_toggle.dart';
import 'package:flutter/material.dart';

class ToggleWithTitle extends StatelessWidget {
  final String title;
  final String leftValue;
  final String rightValue;
  final List<bool> controller;
  const ToggleWithTitle({
    super.key,
    required this.title,
    required this.leftValue,
    required this.rightValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        CustomToggle(
          left: leftValue,
          right: rightValue,
          controller: controller,
        ),
      ],
    );
  }
}
