import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackUpIcon extends StatelessWidget {
  final String routeName;

  // ignore: use_super_parameters
  const BackUpIcon({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
      onPressed: () {
        context.goNamed(routeName);
      },
    );
  }
}
