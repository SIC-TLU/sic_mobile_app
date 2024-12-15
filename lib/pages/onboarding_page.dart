import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/images/logo.png', height: 100),
              const SizedBox(height: 60),

              // Illustration
              Image.asset('assets/images/ilustration.png', height: 300),
              const SizedBox(height: 32),

              // Title
              const Text(
                'Student Information Club',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),

              //Subtitle
              const Text(
                'Student empowering students to master tecchnology.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),

              // Sigin Button
              Container(
                margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth', arguments: 0);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA726),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
              const SizedBox(height: 16),

              // Sign Up Button
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/auth', arguments: 1);
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )),
            ],
          ),
        ));
  }
}
