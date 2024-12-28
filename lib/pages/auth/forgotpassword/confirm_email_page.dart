// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:sic_mobile_app/components/common/backup_icon.dart';
import 'package:sic_mobile_app/components/common/custom_button_confirm.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class ConfirmEmailPage extends StatefulWidget {
  const ConfirmEmailPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConfirmEmailPageState createState() => _ConfirmEmailPageState();
}

class _ConfirmEmailPageState extends State<ConfirmEmailPage> {
  final FocusNode _textFieldFocus = FocusNode();
  bool _isEmailValid = false;
  String _email = '';

  @override
  void initState() {
    super.initState();
    _textFieldFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    super.dispose();
  }

  void _checkEmailValidation(String email) {
    setState(() {
      _isEmailValid = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
      ).hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    double _keyboardHeight = getKeyboardHeight(context);
    bool _isKeyboardOpen = _keyboardHeight > 0;
    final screenHeight = getHeight(context);
    final screenWidth = getWidth(context);

    return Scaffold(
      body: Stack(
        // BackUp Button
        children: [
          Positioned(
            top: screenHeight * 0.07,
            left: screenWidth * 0.015,
            child: const BackUpIcon(routeName: "auth"),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.06),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.01),

                    // Title
                    const Text(
                      "Forgot password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    // Subtitle
                    const Text(
                      "Enter your email linked with account to reset password",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    //Email Field
                    TextField(
                      focusNode: _textFieldFocus,
                      onChanged: (value) {
                        _email = value;
                        _checkEmailValidation(_email);
                      },
                      decoration: InputDecoration(
                        labelText: "Example@gmail.com",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Added this
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Button Send Code
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 16,
            right: 16,
            bottom: _isKeyboardOpen
                ? (_keyboardHeight > 100 ? 10 : 10)
                : screenHeight * 0.05,
            child: CustomButtonConfirm(
              textBotton: "Send me code",
              routeName: "verification",
              checkConfirm: _isEmailValid,
            ),
          ),
        ],
      ),
    );
  }
}
