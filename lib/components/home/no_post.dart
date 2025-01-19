import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoPostsPage extends StatelessWidget {
  final double screenHeight;

  const NoPostsPage({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.79,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image No Post
            SvgPicture.asset(
              'assets/images/no_posts.svg',
              height: 300,
            ),
            SizedBox(height: screenHeight * 0.03),

            // Text Content
            const Text(
              'No available post',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
