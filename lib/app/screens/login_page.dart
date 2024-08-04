import 'package:flutter/material.dart';
import '../material/toggle.dart';  // Adjust the path as necessary

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ThemeManager(),
    );
  }
}

class ThemeManager extends StatefulWidget {
  const ThemeManager({super.key});

  @override
  _ThemeManagerState createState() => _ThemeManagerState();
}

class _ThemeManagerState extends State<ThemeManager> {
  bool _isDarkMode = false;  // Initial theme state

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: LoginPage(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) toggleTheme;

  const LoginPage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Login Page'),
        actions: [
          ThemeToggleSwitch(isDarkMode: isDarkMode, onToggle: toggleTheme),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'The only productivity app you need',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/logo.png',
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Sign in with Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Google'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Apple ID'),
            ),
            const SizedBox(height: 20),
            Text(
              'By Continuing you agree to the Terms and Conditions',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
