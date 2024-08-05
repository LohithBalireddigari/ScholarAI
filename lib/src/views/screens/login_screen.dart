import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholarai/src/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailResetController = TextEditingController();
  bool isLogin = true; // Toggle between Login and Register

  void _toggleFormMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void _submit() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    if (isLogin) {
      final user = await authService.signInWithEmail(_emailController.text, _passwordController.text);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed', style: TextStyle(color: Colors.redAccent))));
      }
    } else {
      final user = await authService.signUpWithEmail(_emailController.text, _passwordController.text);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed', style: TextStyle(color: Colors.redAccent))));
      }
    }
  }

  void _resetPassword() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.sendPasswordResetEmail(_emailResetController.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password reset link sent to your email', style: TextStyle(color: Colors.green)),
      duration: Duration(seconds: 5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isLogin ? 'Login' : 'Register'),
              ),
              TextButton(
                onPressed: _toggleFormMode,
                child: Text(isLogin ? 'Create an account' : 'Have an account? Sign in', style: TextStyle(color: Colors.blue)),
              ),
              TextField(
                controller: _emailResetController,
                decoration: InputDecoration(
                  hintText: 'Reset password email',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.restore, color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: _resetPassword,
                child: Text('Reset Password', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
