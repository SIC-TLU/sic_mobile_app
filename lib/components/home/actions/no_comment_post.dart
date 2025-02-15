import 'package:flutter/material.dart';

class NoPostComment extends StatelessWidget {
  const NoPostComment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Comments yet',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Start the conversation',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black38,
            fontWeight: FontWeight.w300,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}
