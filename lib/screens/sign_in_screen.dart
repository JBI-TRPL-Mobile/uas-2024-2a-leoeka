import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Learn ipsum dolor sit amet, consectetur \nadipiscing elit, sed do",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "yourmail@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Tambahkan logika "Forgot Password" di sini
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Simulasi pengambilan data untuk userName dan userEmail
                    String userName = "William";
                    String userEmail = emailController.text;

                    // Navigasi ke HomeScreen setelah login berhasil
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          userName: userName,
                          userEmail: userEmail,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Sign In"),
                ),
                const SizedBox(height: 20),
                const Text("or sign in with"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.g_mobiledata, size: 40),
                      onPressed: () {
                        // Tambahkan logika login dengan Google di sini
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.facebook, size: 40),
                      onPressed: () {
                        // Tambahkan logika login dengan Facebook di sini
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Sign Up
                  },
                  child: const Text(
                    "Don't have an account? Sign Up Now",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
