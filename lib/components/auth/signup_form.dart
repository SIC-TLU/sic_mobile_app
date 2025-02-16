import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sic_mobile_app/components/auth/password_condition.dart';
import 'package:sic_mobile_app/components/common/custom_text_field.dart';
import 'package:sic_mobile_app/components/common/password_fied.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  bool _agreeToTerms = false;
  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _hasUpperAndLower = false;
  bool _passwordsMatch = false;
  String _password = '';
  String _confirmPassword = '';
  bool _canScroll = false;

  @override
  void initState() {
    super.initState();
    _confirmPasswordFocusNode.addListener(() {
      if (_confirmPasswordFocusNode.hasFocus) {
        setState(() {
          _canScroll = true;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        });
      } else {
        setState(() {
          _canScroll = false;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _checkPassword(String password) {
    setState(() {
      _password = password;
      _hasMinLength = password.length >= 8;
      _hasNumber = password.contains(RegExp(r'\d'));
      _hasUpperAndLower = password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]'));
      _passwordsMatch = password == _confirmPassword;
    });
  }

  void _checkConfirmPassword(String confirmPassword) {
    setState(() {
      _confirmPassword = confirmPassword;
      _passwordsMatch = _password == confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = getHeight(context);

    bool isFormValid = _agreeToTerms &&
        _hasMinLength &&
        _hasNumber &&
        _hasUpperAndLower &&
        _passwordsMatch;

    return SingleChildScrollView(
      physics: _canScroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: _scrollController,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(
              icon: LucideIcons.user2,
              hintText: 'Enter your name',
            ),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(
              icon: LucideIcons.mail,
              hintText: 'Enter your email',
            ),
            SizedBox(height: screenHeight * 0.02),
            PasswordField(onChanged: _checkPassword),
            SizedBox(height: screenHeight * 0.02),
            PasswordField(
              labelText: 'Confirm your password',
              onChanged: _checkConfirmPassword,
              focusNode: _confirmPasswordFocusNode,
            ),
            SizedBox(height: screenHeight * 0.02),

            // Password conditions
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PasswordCondition(
                    text: 'At least 8 characters', isValid: _hasMinLength),
                PasswordCondition(
                    text: 'At least 1 number', isValid: _hasNumber),
                PasswordCondition(
                  text: 'Both upper and lower case letters',
                  isValid: _hasUpperAndLower,
                ),
                PasswordCondition(
                    text: 'Password match', isValid: _passwordsMatch),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),

            // Terms & Conditions checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  checkColor: Colors.orange,
                  activeColor: Colors.white,
                  side: const BorderSide(color: Colors.black45, width: 1.0),
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                const Text(
                  'By agreeing to the terms and conditions, you are entering "\ninto a legally binding contract with the service provider.',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            // Sign Up Button
            ElevatedButton(
              onPressed: isFormValid
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        // Handle sign up
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
