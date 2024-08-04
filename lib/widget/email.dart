import 'package:flutter/material.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({Key? key}) : super(key: key);

  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

  void _attemptLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network request/wait
    Future.delayed(Duration(seconds: 2), () {
      // This is where you would typically handle actual authentication
      setState(() {
        _isLoading = false;
      });

      // For now, just close the login screen on success
      if (_emailController.text == "example@example.com" && _passwordController.text == "password") {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials'))
        );
      }
    });
  }
}
