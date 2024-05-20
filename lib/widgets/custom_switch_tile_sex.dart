import 'package:brookmate/widgets/toggle_switch.dart';
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10), // Add some space between text and switch
          ToggleSwitchWidget(
            toggleSwitch: toggleSwitch,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }
}
