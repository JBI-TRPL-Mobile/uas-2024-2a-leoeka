import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'message_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfileScreen({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${userName}\'s Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $userName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Apakah Anda yakin ingin log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                              context,
                              '/login',
                            );
                          },
                          child: const Text('Log Out'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      user: User(
                        id: 1,
                        name: userName,
                        email: userEmail,
                        categories: ['Tech', 'Design'],
                        topCourses: ['Flutter', 'Dart'],
                      ),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Handle Favorite button
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Stay on ProfileScreen
              },
            ),
          ],
        ),
      ),
    );
  }
}
