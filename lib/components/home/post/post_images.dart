import 'package:flutter/material.dart';
import 'package:sic_mobile_app/Data.dart';

class PostImage extends StatelessWidget {
  final PostData post;
  final double screenHeight;
  final double screenWidth;
  const PostImage({
    super.key,
    required this.post,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (post.imageUrls == null || post.imageUrls!.isEmpty) {
      return const SizedBox();
    }

    double imageHeight = 300;
    final int imageCount = post.imageUrls!.length;

    switch (imageCount) {
      case 1:
        return SizedBox(
          height: imageHeight,
          child: Image.asset(
            post.imageUrls![0],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      case 2:
        return SizedBox(
            height: imageHeight,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(post.imageUrls![0],
                      fit: BoxFit.cover, height: double.infinity),
                ),
                SizedBox(width: screenWidth * 0.01),
                Expanded(
                  child: Image.asset(post.imageUrls![1],
                      fit: BoxFit.cover, height: double.infinity),
                ),
              ],
            ));
      case 3:
        return SizedBox(
            height: imageHeight,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(post.imageUrls![0],
                      fit: BoxFit.cover, height: double.infinity),
                ),
                SizedBox(width: screenWidth * 0.01),
                Expanded(
                  child: Image.asset(post.imageUrls![1],
                      fit: BoxFit.cover, height: double.infinity),
                ),
                SizedBox(width: screenWidth * 0.01),
                Expanded(
                  child: Image.asset(post.imageUrls![2],
                      fit: BoxFit.cover, height: double.infinity),
                ),
              ],
            ));

      case 4:
        return SizedBox(
          height: imageHeight,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(post.imageUrls![0], fit: BoxFit.cover),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      child: Image.asset(post.imageUrls![1], fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child:
                            Image.asset(post.imageUrls![2], fit: BoxFit.cover)),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      child: Image.asset(post.imageUrls![3], fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return SizedBox(
          height: imageHeight,
          child: Column(
            children: [
              Expanded(
                // Sử dụng Expanded ở đây
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(post.imageUrls![0], fit: BoxFit.cover),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      child: Image.asset(post.imageUrls![1], fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Expanded(
                // Sử dụng Expanded ở đây
                child: Row(children: [
                  Expanded(
                    child: Image.asset(post.imageUrls![2],
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: Image.asset(
                      post.imageUrls![3],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(post.imageUrls![4],
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity),
                        Center(
                            child: Text(
                          "+${imageCount - 5}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
    }
  }
}
