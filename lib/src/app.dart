import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scholarai/src/services/auth_service.dart';
import 'package:scholarai/src/views/screens/login_screen.dart';
import 'package:scholarai/src/views/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Flutter Auth',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
          child: Consumer<User?>(
            builder: (context, user, _) {
              if (user != null) {
                return HomeScreen();
              }
              return LoginScreen();
            },
          ),
        ),
      ),
    );
  }
}
