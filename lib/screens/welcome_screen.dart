import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Youth Opportunity Hub')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Image from Internet
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://media.istockphoto.com/id/1440160913/photo/group-of-young-college-students-taking-a-computer-class-together.jpg?s=612x612&w=0&k=20&c=bY9n9lvqXNsilbMtC5pzOvO-TEUy7pp2dlfOqDjhEiI=',
                height: 270,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Styled Container with welcome message
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Welcome to the Youth Opportunity Hub!\nEmpowering Kenyan youth with real opportunities.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print("Get Started Button Clicked!");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text("Get Started"),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
