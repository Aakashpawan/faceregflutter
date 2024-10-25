import 'package:flutter/material.dart';
import 'package:face_detection/login_page.dart';
void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2), // Adjust the duration as needed
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()), // Replace with your main screen
        );
      },
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo4.png'), // Use the asset path
            fit: BoxFit.scaleDown,
          ),
        ),
        child: const Center(
          // You can add additional widgets or branding elements here
        ),
      ),
    );
  }
}
