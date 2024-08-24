import 'package:flutter/material.dart';
import 'package:gitako/screens/register_screen.dart';
import 'package:gitako/screens/login_screen.dart';

void main() {
  runApp(GitakoApp());
}

class GitakoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gitako AgricTech',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
