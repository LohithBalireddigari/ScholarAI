import 'package:flutter/material.dart';

class ThemeToggleSwitch extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;

  const ThemeToggleSwitch({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
      color: isDarkMode ? Colors.white : Colors.black,
      onPressed: () => onToggle(!isDarkMode),
      tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
    );
  }
}
