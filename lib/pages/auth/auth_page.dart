import 'package:flutter/material.dart';
import 'package:sic_mobile_app/components/auth/login_form.dart';
import 'package:sic_mobile_app/components/auth/signup_form.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class AuthPage extends StatelessWidget {
  final int initialTabIndex;

  const AuthPage({super.key, required this.initialTabIndex});

  @override
  Widget build(BuildContext context) {
    final screenHeight = getHeight(context);
    final screenWidth = getWidth(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            // Logo
            Image.asset('assets/images/logo.png', height: 100),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              'Welcome to SIC',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              'Sign up or login to get ready for an exciting journey with SIC',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Tabs
            DefaultTabController(
              length: 2,
              initialIndex: initialTabIndex,
              child: Column(
                children: [
                  const TabBar(
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
                    height: screenHeight * 0.6,
                    child: const TabBarView(
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
