import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final String left;
  final String right;
  final List<bool> controller;

  const CustomToggle({
    super.key,
    required this.left,
    required this.right,
    required this.controller,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: Colors.white,
      color: const Color(0xff820000),
      isSelected: widget.controller,
      borderRadius: BorderRadius.circular(25),
      borderColor: const Color(0xff820000),
      selectedBorderColor: const Color(0xff820000),
      borderWidth: 1,
      constraints: const BoxConstraints.tightFor(width: 50, height: 25),
      onPressed: (index) {
        setState(() {
          widget.controller[index] = !widget.controller[index];
          widget.controller[1 - index] = !widget.controller[index];
        });
      },
      children: [
        Container(
          width: 50,
          height: 25,
          decoration: BoxDecoration(
            color: widget.controller[0]
                ? const Color(0xff820000)
                : const Color(0xffF6F6F6),
          ),
          child: Center(
              child: Text(widget.left, style: const TextStyle(fontSize: 10))),
        ),
        Container(
          width: 50,
          height: 25,
          decoration: BoxDecoration(
            color: widget.controller[1]
                ? const Color(0xff820000)
                : const Color(0xffF6F6F6),
          ),
          child: Center(
              child: Text(widget.right, style: const TextStyle(fontSize: 10))),
        ),
      ],
    );
  }
}
