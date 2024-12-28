// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:sic_mobile_app/components/common/backup_icon.dart';
import 'package:sic_mobile_app/components/common/custom_button_confirm.dart';
import 'package:sic_mobile_app/components/common/password_fied.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String _password = '';
  String _confirmPassword = '';
  bool _passwordsMatch = false;
  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _hasUpperAndLower = false;

  final FocusNode _textFieldFocus = FocusNode();
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

  void _handlePasswordChanged(String password) {
    setState(() {
      _password = password;
      _checkPassword(password);
      _checkConfirmPassword(_confirmPassword);
    });
  }

  void _checkConfirmPassword(String confirmPassword) {
    setState(() {
      _confirmPassword = confirmPassword;
      _passwordsMatch = _password == confirmPassword;
    });
  }

  void _checkPassword(String password) {
    _hasMinLength = password.length >= 6;
    _hasNumber = password.contains(RegExp(r'\d'));
    _hasUpperAndLower = password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]'));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    double _keyboardHeight = getKeyboardHeight(context);
    bool _isKeyboardOpen = _keyboardHeight > 0;
    final screenHeight = getHeight(context);
    final screenWidth = getWidth(context);

    bool _isValidForm =
        _hasMinLength && _hasNumber && _hasUpperAndLower && _passwordsMatch;

    return Scaffold(
      body: Stack(
        // BackUp Button
        children: [
          Positioned(
            top: screenHeight * 0.07,
            left: screenWidth * 0.015,
            child: const BackUpIcon(routeName: "verification"),
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
                      "Setup password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    // Subtitle
                    const Text(
                      "New password must contain at least 6 characters including uppercase letters, lowercase letters and numbers",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // New password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text("New password",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        PasswordField(
                          onChanged: _handlePasswordChanged,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    //Confirm New Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text("Confirm password",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        PasswordField(
                          labelText: 'Enter your confirm password',
                          onChanged: _checkConfirmPassword,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Button Save Password
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 16,
            right: 16,
            bottom: _isKeyboardOpen
                ? (_keyboardHeight > 100 ? 10 : 10)
                : screenHeight * 0.05,
            child: CustomButtonConfirm(
              textBotton: "Save password",
              routeName: "auth",
              checkConfirm: _isValidForm,
            ),
          ),
        ],
      ),
    );
  }
}
