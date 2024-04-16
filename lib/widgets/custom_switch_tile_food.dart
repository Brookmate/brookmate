import 'package:flutter/material.dart';

class CustomSwitchTileFood extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const CustomSwitchTileFood({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });

  Widget customSwitchTileFood(
      String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 21)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value ? 'Outdoor' : 'Indoor'),
          Switch.adaptive(
            value: value,
            activeColor: Colors.red,
            onChanged: onChanged,
          ),
        ],
      ),
      onTap: () => onChanged(!value),
    );
  }

  @override
  Widget build(BuildContext context) {
    // You can use the widgets here or expose them to be used externally
    return Container(); // or any other widget that uses the custom switches
  }
}
