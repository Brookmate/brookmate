import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomSwitchTileSex extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final bool toggleSwitch;

  const CustomSwitchTileSex({
    required this.title,
    required this.value,
    required this.onChanged,
    this.toggleSwitch = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10), // Add some space between text and switch
          ToggleSwitch(
            minWidth: 100.0,
            minHeight: 50.0,
            fontSize: 16.0,
            cornerRadius: 20.0,
            initialLabelIndex: 1,
            activeBgColor: [Color(0xff9C0000)],
            activeFgColor: Colors.white,
            inactiveBgColor: Color.fromARGB(255, 246, 246, 246),
            inactiveFgColor: Colors.black,
            totalSwitches: 2,
            labels: ['Female', 'Male'],
            onToggle: (index) {
              print('switched to: $index');
            },
          )
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }
}
