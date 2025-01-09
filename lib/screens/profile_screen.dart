import 'package:flutter/material.dart';

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

            // Tombol Log Out
            ElevatedButton(
              onPressed: () {
                // Tampilkan dialog konfirmasi
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
                            Navigator.pop(context); // Tutup dialog
                            Navigator.pushReplacementNamed(
                              context,
                              '/login', // Arahkan ke halaman LoginScreen
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
                backgroundColor: Colors.red, // Warna tombol log out
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
