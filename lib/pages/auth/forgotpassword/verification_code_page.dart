// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:sic_mobile_app/components/common/backup_icon.dart';
import 'package:sic_mobile_app/components/common/custom_button_confirm.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final FocusNode _textFieldFocus = FocusNode();
  late int endTime;
  bool _canResend = false;
  final List<String> _otpValues = List.generate(6, (_) => '');

  @override
  void initState() {
    super.initState();
    _textFieldFocus.addListener(() {
      setState(() {});
    });

    startTimer();
  }

  void startTimer() {
    endTime = DateTime.now().millisecondsSinceEpoch + 300 * 1000;
    _canResend = false;
    setState(() {});
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    super.dispose();
  }

  void _handleOtpChange(String value, int index) {
    setState(() {
      _otpValues[index] = value;
    });

    value.isNotEmpty ? _handleFocusChange(index) : _handleBackSpaceFocus(index);
  }

  void _handleFocusChange(int index) {
    index < 5
        ? FocusScope.of(context).nextFocus()
        : FocusScope.of(context).unfocus();
  }

  void _handleBackSpaceFocus(int index) {
    if (index > 0) FocusScope.of(context).previousFocus();
  }

  void _handleResendCode() {
    startTimer();

    //Logic Backend Resend Code
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = getKeyboardHeight(context);
    bool isKeyboardOpen = keyboardHeight > 0;
    final screenHeight = getHeight(context);
    final screenWidth = getWidth(context);

    return Scaffold(
      body: Stack(
        children: [
          // Back Button
          Positioned(
            top: screenHeight * 0.07,
            left: screenWidth * 0.015,
            child: const BackUpIcon(routeName: "confirmmail"),
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

                    // OTP Field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: screenWidth * 0.13,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                              ),
                            ),
                            onChanged: (value) {
                              _handleOtpChange(value, index);
                            },
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    //Send Code Again
                    Center(
                      child: GestureDetector(
                        onTap: _canResend ? _handleResendCode : null,
                        child: CountdownTimer(
                          endTime: endTime,
                          onEnd: () {
                            if (mounted) {
                              setState(() {
                                _canResend = true;
                              });
                            }
                          },
                          widgetBuilder: (context, time) => Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Send code again ",
                                  style: TextStyle(
                                    color: _canResend
                                        ? Colors.orange
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: time == null
                                      ? "0:0"
                                      : "${time.min ?? 0}:${time.sec ?? 0}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Confirm Button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 16,
            right: 16,
            bottom: isKeyboardOpen
                ? (keyboardHeight > 100 ? 10 : 10)
                : screenHeight * 0.05,
            child: CustomButtonConfirm(
                textBotton: "Confirm",
                routeName: "resetpassword",
                checkConfirm: _otpValues.join().length == 6),
          ),
        ],
      ),
    );
  }
}
