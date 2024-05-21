import 'package:flutter/material.dart';
import 'package:brookmate/widgets/toggle_switch_yes_no.dart';

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
          CustomSwitchTileWidget(
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
