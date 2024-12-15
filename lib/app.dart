import 'package:flutter/material.dart';
import 'package:sic_mobile_app/pages/auth/auth_page.dart';
import 'pages/onboarding_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onbaording Screen',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const OnboardingPage(),
      initialRoute: '/',
      routes: {
        '/auth': (context) => const AuthPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
