import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final bool toggleSwitch;

  const CustomSwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.toggleSwitch = false, // default value for toggleSwitch
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value ? 'Yes' : 'No'),
          SizedBox(width: 10), // Add some space between text and switch
          toggleSwitch
              ? ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Color(0xff9C0000)!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: value ? 0 : 1,
                  totalSwitches: 2,
                  labels: ['Yes', 'No'],
                  radiusStyle: true,
                  onToggle: (index) {
                    onChanged(index == 0 ? true : false);
                  },
                )
              : Switch.adaptive(
                  value: value,
                  activeColor: const Color(0xff9C0000),
                  onChanged: onChanged,
                ),
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }
}
