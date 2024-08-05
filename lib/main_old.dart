import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/theme_provider.dart';
import 'screens/theme_manager.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart'; // Make sure to create this file in your screens folder.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        title: 'Scholar AI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login', // Set the initial route
        routes: {
          '/login': (context) => LoginPage(),
          '/home_page': (context) => HomePage(),
        },
        home: ThemeManager(), // Initially displayed widget.
      ),
    );
  }
}
