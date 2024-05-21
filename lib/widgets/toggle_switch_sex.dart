import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitchWidget extends StatelessWidget {
  final bool toggleSwitch;
  final bool value;
  final Function(bool) onChanged;

  const ToggleSwitchWidget({
    required this.toggleSwitch,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return toggleSwitch
        ? ToggleSwitch(
            minWidth: 100.0,
            minHeight: 50.0,
            fontSize: 16.0,
            cornerRadius: 20.0,
            initialLabelIndex: 1,
            activeBgColor: [Color(0xff9C0000)],
            activeFgColor: Colors.white,
            inactiveBgColor: Color.fromRGBO(246, 246, 246, 1),
            inactiveFgColor: Color(0xff9C0000),
            totalSwitches: 2,
            labels: ['Male', 'Female'],
            onToggle: (index) {
              print('switched to: $index');
            },
          )
        : Switch.adaptive(
            value: value,
            activeColor: const Color(0xff9C0000),
            onChanged: onChanged,
          );
  }
}
