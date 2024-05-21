import 'package:flutter/material.dart';

class DoubleSlider extends StatelessWidget {
  final RangeValues sleepTime;
  final ValueChanged<RangeValues> onChanged;

  const DoubleSlider({
    required this.sleepTime,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Sleeping Time', style: TextStyle(fontSize: 21)),
        ),
        RangeSlider(
          values: sleepTime,
          min: 0,
          max: 24,
          divisions: 24,
          labels: RangeLabels(
            (sleepTime.start < 12
                ? "${sleepTime.start.round().toString()} PM"
                : sleepTime.start == 12
                    ? "${sleepTime.start.round().toString()} AM"
                    : sleepTime.start == 24
                        ? "${sleepTime.start.round() - 12} PM"
                        : "${sleepTime.start.round() - 12} AM"),
            (sleepTime.end < 12
                ? "${sleepTime.end.round().toString()} PM"
                : sleepTime.end == 12
                    ? "${sleepTime.end.round().toString()} AM"
                    : sleepTime.end == 24
                        ? "${sleepTime.end.round() - 12} PM"
                        : "${sleepTime.end.round() - 12} AM"),
          ),
          activeColor: Color(0x8f1b11),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
