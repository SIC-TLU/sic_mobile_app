import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PasswordField extends StatefulWidget {
  final String labelText;
  final void Function(String)? onChanged;
  final FocusNode? focusNode; // Thêm focusNode vào constructor

  const PasswordField(
      {super.key,
      this.labelText = 'Enter your password',
      this.onChanged,
      this.focusNode});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        prefixIcon: const Icon(LucideIcons.lock),
        hintText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? LucideIcons.eye : LucideIcons.eyeOff,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange, width: 1.0),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: widget.onChanged,
    );
  }
}
