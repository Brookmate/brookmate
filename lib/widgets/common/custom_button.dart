import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final double size;
  final String text;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size * 0.05)),
        backgroundColor: const Color(0xff820000),
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: size,
        height: size * 0.2,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: size * 0.065,
            ),
          ),
        ),
      ),
    );
  }
}
