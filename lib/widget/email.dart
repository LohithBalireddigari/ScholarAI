import 'package:flutter/material.dart';
import '../services/auth_service.dart';  // Make sure to import AuthService correctly

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();  // Instance of AuthService
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        _isLoading ? CircularProgressIndicator() : ElevatedButton(
          onPressed: _attemptLogin,
          child: const Text('Log in'),
        ),
      ],
    );
  }

  void _attemptLogin() async {
    setState(() {
      _isLoading = true;
    });

    // Use AuthService to perform the login
    try {
      var user = await _authService.signInWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home_page');  // Adjust this as needed for your app's routing
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
