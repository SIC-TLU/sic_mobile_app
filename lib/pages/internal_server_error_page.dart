import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sic_mobile_app/components/common/custom_button_backup.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class InternalServerErrorPage extends StatelessWidget {
  const InternalServerErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = getHeight(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                child: SvgPicture.asset(
                  'assets/images/internal_server_error.svg',
                  fit: BoxFit.contain,
                  height: 216,
                  width: 373,
                ),
              ),
            ),

            // Title Text
            const Text(
              'Internal server\nerror',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: screenHeight * 0.005),

            // Subtitle Text
            Text(
              'Please return to the home page to\nexplore more exciting features.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: screenHeight * 0.06),

            // Button Navigate Back
            const CustomButtonBackup(
              routeName: "auth",
              textBotton: "Back to home page",
            ),
            //
          ],
        ),
      ),
    );
  }
}
