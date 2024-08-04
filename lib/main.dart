import 'package:flutter/material.dart';
import 'app/screens/login_page.dart'; // Adjust the path according to your project structure

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false; // You can determine this based on user settings or system settings

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(isDarkMode: isDarkMode, toggleTheme: (bool ) {  },),
    );
  }
}
