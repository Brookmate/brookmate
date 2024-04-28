import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Topbar extends StatefulWidget {
  String? inputText;
  Topbar({
    super.key,
  });

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 7,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color(0xff9C0000),
              ),
            ),
            child: SearchBar(
              onSubmitted: (value) {
                setState(() => widget.inputText = value);
              },
              onChanged: (value) {
                setState(() => widget.inputText = value);
              },
              constraints: const BoxConstraints(maxWidth: double.maxFinite),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.shopping_cart,
          color: Color(0xff9C0000),
        ),
      ],
    );
  }
}
