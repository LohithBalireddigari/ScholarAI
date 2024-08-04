import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';  // Adjust the path as necessary

class ThemeToggleSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the ThemeProvider from the widget tree
    final themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
      icon: Icon(themeProvider.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
      onPressed: () {
        themeProvider.toggleTheme(!themeProvider.isDarkMode);
      },
      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
      tooltip: themeProvider.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
    );
  }
}
