import 'package:flutter/material.dart';
import 'package:student2/SCREENS/firstScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'student',
      theme: ThemeData(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
