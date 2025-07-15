import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const YouthHubApp());
}

class YouthHubApp extends StatelessWidget {
  const YouthHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youth Opportunity Hub',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
