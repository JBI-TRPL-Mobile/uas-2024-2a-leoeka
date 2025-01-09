import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Impor ProfileScreen
import 'message_screen.dart'; // Impor MessageScreen

// Model User
class User {
  final int id;
  final String name;
  final String email;
  final List<String> categories;
  final List<String> topCourses;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.categories,
    required this.topCourses,
  });
}

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome message
                Text(
                  "Welcome, ${user.name}!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Motivational subtitle
                const Text(
                  "Keep Moving Up",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),

                // Placeholder image (hero section)
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Categories section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle "See All" button
                      },
                      child: const Text("See All"),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: user.categories.map((category) {
                    return Chip(
                      label: Text(category),
                      backgroundColor: Colors.blue[50],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Top Courses section
                const Text(
                  "Top Courses",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 150, // Height for horizontal scroll
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: user.topCourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.book,
                                size: 50,
                                color: Colors.blue,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                user.topCourses[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle Home button
              },
            ),
            IconButton(
              icon: const Icon(Icons.message), // Ikon pesan
              onPressed: () {
                Navigator.push(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      userName: user.name,
                      userEmail: user.email,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB button
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
