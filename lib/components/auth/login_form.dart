import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sic_mobile_app/components/common/password_fied.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _hasMinLengthName = false;
  bool _hasMinLengthPassWord = false;
  bool _hasNumber = false;
  bool _hasUpperAndLower = false;
  bool _isForgotPasswordTapped = false;

  void _checkUsername(String username) {
    setState(() {
      _hasMinLengthName = username.length >= 3;
    });
  }

  void _checkPassword(String password) {
    setState(() {
      _hasMinLengthPassWord = password.length >= 8;
      _hasNumber = password.contains(RegExp(r'\d'));
      _hasUpperAndLower = password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]'));
    });
  }

  void _onForgotPasswordTapped() {
    setState(() {
      _isForgotPasswordTapped = !_isForgotPasswordTapped;
    });
    context.goNamed('confirmmail');
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = _hasMinLengthName &&
        _hasMinLengthPassWord &&
        _hasNumber &&
        _hasUpperAndLower;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Username Field
          const SizedBox(height: 15),
          TextFormField(
            onChanged: _checkUsername,
            decoration: InputDecoration(
                prefixIcon: const Icon(LucideIcons.user2),
                hintText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.orange),
                )),
          ),
          const SizedBox(height: 15),
          PasswordField(
            onChanged: _checkPassword,
          ),

          const SizedBox(height: 15),

          // Forgot Password
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: _onForgotPasswordTapped,
                highlightColor: Colors.orange,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    decoration: _isForgotPasswordTapped
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    // decorationColor: Colors.orange,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          // Login Button
          ElevatedButton(
            onPressed: isFormValid
                ? () {
                    if (_formKey.currentState!.validate()) {
                      context.goNamed('home');
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(
                    text: 'By signing up, you agree to our ',
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      highlightColor: Colors.orange,
                      onTap: () {
                        // Handle Term of service
                      },
                      child: const Text(
                        'Term of service',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const TextSpan(
                    text: '\n and ',
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      highlightColor: Colors.orange,
                      onTap: () {
                        // Handle Privacy Policy
                      },
                      child: const Text(
                        'Privacy policy',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
