import 'package:flutter/material.dart';
import 'login/login_view.dart';
import 'signup/signup_view.dart';
import 'intro/intro_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const IntroView(),
    );
  }
}
