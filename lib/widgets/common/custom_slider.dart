import 'dart:js_util';

import 'package:brookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;
  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.divisions,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 5,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 10.0,
        ),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
        overlayColor: const Color(0xffF88282).withOpacity(1.0),
        valueIndicatorColor: Colors.black,
      ),
      child: Slider(
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        activeColor: AppTheme.primaryColor,
        thumbColor: AppTheme.primaryColor,
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}
