import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fredy_me/features/auth/pages/my_widget.dart';
import 'package:fredy_me/features/auth/repository/auth_service.dart';
// import 'package:fredy_me/features/home/my_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/youtube.png", height: 150),
              const SizedBox(height: 20),
              const Text(
                "Welcome To YouTube",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 55.0),
                child: GestureDetector(
                  onTap: () async {
                    final user =
                        await ref.read(authServiceProvider).signInWithGoogle();
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MyWidget()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Google Sign-In canceled")),
                      );
                    }
                  },
                  child: Image.asset(
                    "assets/images/signInWithGoogle.jpeg",
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
