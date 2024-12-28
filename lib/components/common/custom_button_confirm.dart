import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonConfirm extends StatelessWidget {
  final String textBotton;
  final String? routeName;
  final bool isEnabled;
  final Color? buttonColor;
  final Color? textColor;
  final bool checkConfirm;

  const CustomButtonConfirm({
    super.key,
    required this.textBotton,
    this.routeName,
    this.isEnabled = true,
    this.buttonColor,
    this.textColor,
    required this.checkConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final buttonIsEnabled = isEnabled && checkConfirm;

    return ElevatedButton(
      onPressed: buttonIsEnabled
          ? () {
              if (routeName != null) {
                context.goNamed(routeName!);
              }
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            buttonIsEnabled ? buttonColor ?? Colors.orange : Colors.grey[300],
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        textBotton,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: buttonIsEnabled ? textColor ?? Colors.white : Colors.grey[700],
        ),
      ),
    );
  }
}
