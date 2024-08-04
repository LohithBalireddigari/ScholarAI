import 'package:flutter/material.dart';
import 'package:scholarai/widget/email.dart';
import '../widget/toogle_widget.dart';  // Import the EmailSignIn widget

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigningInWithEmail = false;  // State to manage email sign-in visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Scholar AI'),
        actions: [
          ThemeToggleSwitch(),
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
            const SizedBox(height: 50),
            if (!_isSigningInWithEmail)  // Show the button only if not signing in with email
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  setState(() {
                    _isSigningInWithEmail = true;  // Show the email form and hide the button
                  });
                },
                child: const Text('Sign in with Email'),
              ),
            if (_isSigningInWithEmail) EmailSignIn(),  // Show the EmailSignIn widget
            // Other buttons and text...
          ],
        ),
      ),
    );
  }
}
