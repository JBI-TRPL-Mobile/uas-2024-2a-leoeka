import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      "id": 1,
      "sender": "Leo Eka Matra",
      "message": "Hello, apa kabarmu?",
      "timestamp": "2025-01-08 10:00:00"
    },
    {
      "id": 2,
      "sender": "Moh Naufal",
      "message": "Bisa kita bertemu besok?",
      "timestamp": "2025-01-08 11:00:00"
    },
    {
      "id": 3,
      "sender": "Dwi Handoko",
      "message": "Selamat pagi!",
      "timestamp": "2025-01-08 08:00:00"
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter messages berdasarkan query pencarian
    final filteredMessages = messages.where((message) {
      final sender = message['sender'].toLowerCase();
      final content = message['message'].toLowerCase();
      final query = searchQuery.toLowerCase();
      return sender.contains(query) || content.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari pesan atau pengirim...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredMessages.length,
              itemBuilder: (context, index) {
                final message = filteredMessages[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    title: Text(
                      message['sender'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(message['message']),
                        const SizedBox(height: 8),
                        Text(
                          message['timestamp'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        message['sender'][0],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
                        name: 'Leo Eka Matra',
                        email: 'leo@example.com',
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
                // Stay on MessageScreen
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      userName: 'Leo Eka Matra',
                      userEmail: 'leo@example.com',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
