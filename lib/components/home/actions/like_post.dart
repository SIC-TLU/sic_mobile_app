import 'package:flutter/material.dart';

class LikePostHandler {
  final Map<int, bool> likedPosts = {};

  /// Toggle like state and return updated likes count as String
  String toggleLike(int index, String currentLikes) {
    int likeCount = int.tryParse(currentLikes) ?? 0;
    if (likedPosts[index] == true) {
      likedPosts[index] = false;
      likeCount = likeCount > 0 ? likeCount - 1 : 0;
    } else {
      likedPosts[index] = true;
      likeCount += 1;
    }
    return likeCount.toString();
  }

  Color getHeartColor(int index) {
    return likedPosts[index] == true ? Colors.red : Colors.black87;
  }
}
