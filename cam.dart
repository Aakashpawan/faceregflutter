import 'package:face_detection/login_page.dart';
import 'package:face_detection/signup.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Preview Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CameraPreviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraPreviewPageState createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  late CameraController _controller;
  late Future<void> _controllerInitializeFuture;

  @override
  void initState() {
    super.initState();
    _controllerInitializeFuture = _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Finder'),
        leading: PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'profile',
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'logout',
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Log Out'),
              ),
            ),
          ],
          onSelected: (String value) {
            if (value == 'profile') {
              // Navigate to the ProfilePage and pass user details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            }
            else if(value == 'logout') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>const LoginPage()),
        );
            }
          }
      ),
      ),
  
      body: FutureBuilder<void>(
        future: _controllerInitializeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: CameraPreview(_controller),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
