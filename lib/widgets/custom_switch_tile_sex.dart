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
          Text(value ? 'Female' : 'Male'),
          SizedBox(width: 10), // Add some space between text and switch
          toggleSwitch
              ? ToggleSwitch(
                  minWidth: 90.0,
                  initialLabelIndex: value ? 1 : 0,
                  cornerRadius: 20.0,
                  activeFgColor: Color(0xff9C0000),
                  inactiveBgColor: Color.fromARGB(255, 246, 246, 246),
                  inactiveFgColor: Color.fromARGB(255, 246, 246, 246),
                  totalSwitches: 2,
                  labels: ['Male', 'Female'],
                  activeBgColors: const [
                    [Color(0xff9C0000)],
                    [Color(0xff9C0000)]
                  ],
                  onToggle: (index) {
                    onChanged(index == 1 ? true : false);
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
