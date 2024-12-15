import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PasswordCondition extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordCondition(
      {super.key, required this.text, this.isValid = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          LucideIcons.checkCircle2,
          size: 18,
          color: isValid ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
