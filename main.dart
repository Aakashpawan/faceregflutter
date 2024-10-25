import 'package:face_detection/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Finder',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
