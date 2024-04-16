import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class topbar extends StatefulWidget {
  String? inputText;
  topbar({
    super.key,
  });

  @override
  State<topbar> createState() => _topbarState();
}

class _topbarState extends State<topbar> {
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
