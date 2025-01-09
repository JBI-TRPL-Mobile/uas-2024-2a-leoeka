import 'package:flutter/material.dart';
import 'package:template_project/screens/login_screen.dart';
import 'package:template_project/screens/profile_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login', // Halaman awal
      routes: {
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const ProfileScreen(
              userName: 'John Doe',
              userEmail: 'johndoe@example.com',
            ),
      },
    );
  }
}
