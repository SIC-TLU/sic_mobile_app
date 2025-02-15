import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sic_mobile_app/components/home/actions/comment_post.dart';
import '../../Data.dart';
import 'actions/like_post.dart';
import 'post/post_images.dart';
import 'post/post_see_more.dart';

class PostListPage extends StatefulWidget {
  final List<PostData> postData;
  final double screenHeight;
  final double screenWidth;

  const PostListPage({
    super.key,
    required this.postData,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final LikePostHandler likePostHandler = LikePostHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int index = 0; index < widget.postData.length; index++)
            buildPostItem(widget.postData[index], index)
        ],
      ),
    );
  }

  Widget buildPostItem(PostData post, int index) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: widget.screenHeight * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: ClipOval(
              child: Image.asset(
                post.avatarUrl?.isNotEmpty == true
                    ? post.avatarUrl!
                    : post.defaultAvatar,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              post.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              post.date,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black45,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.more_horiz,
                size: 35,
              ),
              onPressed: () {},
            ),
          ),
          if (post.title != null && post.title!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                post.title!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 4),
            child: PostSeeMore(
              caption: post.caption,
            ),
          ),
          SizedBox(height: widget.screenHeight * 0.01),
          if (post.hasImages)
            PostImage(
              post: post,
              screenHeight: widget.screenHeight,
              screenWidth: widget.screenWidth,
            ),
          SizedBox(height: widget.screenHeight * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          post.likes =
                              likePostHandler.toggleLike(index, post.likes);
                        });
                      },
                      splashColor: Colors.orange,
                      highlightColor: Colors.orange,
                      child: Icon(
                        LucideIcons.heart,
                        size: 25,
                        color: likePostHandler.getHeartColor(index),
                      ),
                    ),
                    SizedBox(width: widget.screenWidth * 0.005),
                    Text(post.likes),
                  ],
                ),
                SizedBox(width: widget.screenWidth * 0.04),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          builder: (_) {
                            return CommentPost(
                              id: post.id,
                              screenHeight: widget.screenHeight,
                              screenWidth: widget.screenWidth,
                              comments: post.comments,
                              username: post.username,
                              avatarUrl: post.avatarUrl,
                              defaultAvatar: post.defaultAvatar,
                            );
                          },
                        );
                        setState(() {});
                      },
                      child: const Icon(
                        LucideIcons.messageCircle,
                        size: 25,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: widget.screenWidth * 0.005),
                    Text(post.comments.length.toString()),
                  ],
                ),
                SizedBox(width: widget.screenWidth * 0.04),
                Row(
                  children: [
                    const Icon(LucideIcons.share2,
                        size: 25, color: Colors.black87),
                    SizedBox(width: widget.screenWidth * 0.005),
                    Text(post.shares),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      LucideIcons.bookmark,
                      size: 25,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
