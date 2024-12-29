import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class CustomButtonBackup extends StatelessWidget {
  final String textBotton;
  final String? routeName;
  final bool isEnabled;

  const CustomButtonBackup(
      {super.key,
      required this.textBotton,
      this.routeName,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    final screenWidth = getWidth(context);
    return SizedBox(
      width: screenWidth * 245 / 390,
      child: ElevatedButton(
        onPressed: (routeName != null)
            ? () {
                context.goNamed(routeName!);
              }
            : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          textBotton,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: routeName != null ? Colors.white : Colors.grey[700]),
        ),
      ),
    );
  }
}
