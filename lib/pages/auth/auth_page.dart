import 'package:flutter/material.dart';
import 'package:sic_mobile_app/components/auth/login_form.dart';
import 'package:sic_mobile_app/components/auth/signup_form.dart';

class AuthPage extends StatelessWidget {
  final int initialTabIndex;

  const AuthPage({super.key, required this.initialTabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png',
              height: 80,
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome to SIC',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sign up or login to get ready for an exciting journey with SIC',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Tabs
            DefaultTabController(
              length: 2,
              initialIndex: initialTabIndex,
              child: const Column(
                children: [
                  TabBar(
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.orange,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 4.0, color: Colors.orange),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      insets: EdgeInsets.symmetric(horizontal: -80.0),
                    ),
                    tabs: [
                      Tab(text: 'Login'),
                      Tab(text: 'Sign Up'),
                    ],
                  ),
                  SizedBox(
                    height: 500, // Adjust this height as needed
                    child: TabBarView(
                      children: [
                        SignInForm(),
                        SignUpForm(),
                      ],
                    ),
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
