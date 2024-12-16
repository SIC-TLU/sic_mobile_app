
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sic_mobile_app/components/auth/password_condition.dart';
import 'package:sic_mobile_app/components/common/cusom_text_field.dart';
import 'package:sic_mobile_app/components/common/password_fied.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;
  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _hasUpperAndLower = false;
  bool _passwordsMatch = false;
  final String _password = '';
  String _confirmPassword = '';

  void _checkPassword(String password) {
    setState(() {
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
    bool isFormValid = _agreeToTerms &&
        _hasMinLength &&
        _hasNumber &&
        _hasUpperAndLower &&
        _passwordsMatch;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Form fields
          const CustomTextField(
              icon: LucideIcons.user2, hintText: 'Enter your name'),
          const SizedBox(height: 15),
          const CustomTextField(
              icon: LucideIcons.mail, hintText: 'Enter your email'),
          const SizedBox(height: 15),
          PasswordField(onChanged: _checkPassword),
          const SizedBox(height: 15),
          PasswordField(
              labelText: 'Confirm your password',
              onChanged: _checkConfirmPassword),
          const SizedBox(height: 15),

          // Password conditions
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PasswordCondition(
                text: 'At lest 8 characters',
                isValid: _hasMinLength,
              ),
              PasswordCondition(
                text: 'At lest 1 number',
                isValid: _hasNumber,
              ),
              PasswordCondition(
                  text: 'Both uper and lower case letters',
                  isValid: _hasUpperAndLower),
              PasswordCondition(
                  text: 'Password match', isValid: _passwordsMatch)
            ],
          ),
          const SizedBox(height: 0),

          // Terms & Conditions checkbox
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              children: [
                Checkbox(
                    value: _agreeToTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    }),
                const Expanded(
                    child: Text(
                      'By agreeing to the tetms and conditions, are entering into a legally biding contract with the service provider.',
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            ),
          ),

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
        ],
      ),
    );
  }
}
