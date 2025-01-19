import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sic_mobile_app/Data.dart';
import 'package:sic_mobile_app/components/home/no_post.dart';
import 'package:sic_mobile_app/components/home/post.dart';
import 'package:sic_mobile_app/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = getHeight(context);
    final screenWidth = getWidth(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                'SIC',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inria-Serif',
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(LucideIcons.bell,
                      size: 28, color: Colors.black),
                  onPressed: () {
                    // Handler for notification
                  },
                ),
              ],
              floating: true,
              pinned: false,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: const Color(0xFFF5F3ED),
                // ignore: unnecessary_null_comparison
                child: (postDataList == null || postDataList.isEmpty)
                    ? NoPostsPage(screenHeight: screenHeight)
                    : PostListPage(
                        postData: postDataList,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
