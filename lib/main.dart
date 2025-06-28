import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SurvivalApp());
}

class SurvivalApp extends StatelessWidget {
  const SurvivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survival App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.greenAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
