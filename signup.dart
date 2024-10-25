import 'package:face_detection/login_page.dart';
import 'package:flutter/material.dart';
import 'package:face_detection/cam1.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _header(context),
          _inputFields(context),
          _loginInfo(context),
        ]),
      ),
    ));
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter details to get started"),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Username",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Email id",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Retype Password",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CameraPreviewPage()
                  ), // Navigate to HomePage
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  _loginInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            // Navigate to the SignUpPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}

