import 'package:flutter/material.dart';
import 'package:sic_mobile_app/routers/routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SIC Mobile App',
      theme: ThemeData(primarySwatch: Colors.orange),
      routerConfig: RouterConfigCustom.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
