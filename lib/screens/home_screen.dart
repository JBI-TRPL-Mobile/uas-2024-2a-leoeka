import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName; // Nama pengguna yang diterima dari Sign In
  final String userEmail; // Email pengguna yang diterima dari Sign In

  const HomeScreen({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message
            Text(
              "Welcome, $userName!",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Subtitle
            const Text(
              "What would you like to do today?",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Example list of features or categories
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.blue),
                    title: const Text("Browse Courses"),
                    onTap: () {
                      // Navigate to Browse Courses screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.message, color: Colors.green),
                    title: const Text("Messages"),
                    onTap: () {
                      // Navigate to Messages screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.orange),
                    title: const Text("Settings"),
                    onTap: () {
                      // Navigate to Settings screen
                    },
                  ),
                  const Divider(),

                  // Navigate to Profile Screen
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.purple),
                    title: const Text("Profile"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            userName: userName,
                            userEmail: userEmail,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
