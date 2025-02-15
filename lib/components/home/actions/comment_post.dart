import 'package:flutter/material.dart';
import 'package:sic_mobile_app/components/home/actions/no_comment_post.dart';

class CommentPost extends StatefulWidget {
  final int id;
  final double screenHeight;
  final double screenWidth;
  final List<Map<String, String>> comments;
  final String username;
  final String? avatarUrl;
  final String defaultAvatar;

  const CommentPost({
    super.key,
    required this.id,
    required this.screenHeight,
    required this.screenWidth,
    this.comments = const [],
    required this.username,
    required this.avatarUrl,
    required this.defaultAvatar,
  });

  @override
  State<CommentPost> createState() => _CommentPostState();
}

class _CommentPostState extends State<CommentPost> {
  final TextEditingController commentController = TextEditingController();
  bool isLoading = false;
  late List<Map<String, String>> currentComments;

  @override
  void initState() {
    super.initState();
    currentComments = List.from(widget.comments);
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(widget.screenWidth * 0.05),
        topRight: Radius.circular(widget.screenWidth * 0.05),
      ),
      child: Container(
        color: Colors.white,
        height: widget.screenHeight * 0.6,
        child: Column(
          children: [
            // Handle Bar
            Padding(
              padding: EdgeInsets.only(top: widget.screenHeight * 0.01),
              child: Container(
                width: widget.screenWidth * 0.25,
                height: widget.screenHeight * 0.005,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: widget.screenHeight * 0.015),
            const Center(
              child: Text(
                'Comment',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Colors.black87),
              ),
            ),

            SizedBox(height: widget.screenHeight * 0.02),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                color: Colors.white,
              ),
            ),

            // Comment List Section
            Expanded(
              child: currentComments.isEmpty
                  ? const NoPostComment()
                  : ListView.builder(
                      itemCount: currentComments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.screenWidth * 0.04,
                            vertical: widget.screenHeight * 0.01,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Avatar
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    width: widget.screenWidth * 0.1,
                                    height: widget.screenWidth * 0.1,
                                    color: Colors.grey.shade300,
                                    child: Icon(
                                      Icons.person,
                                      size: widget.screenWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: widget.screenWidth * 0.02),
                              // Comment Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          currentComments[index]['username'] ??
                                              'Unknown User',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: widget.screenWidth * 0.04,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color: Colors.grey,
                                              size: widget.screenWidth * 0.05,
                                            ),
                                            Text(
                                              '191',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    widget.screenWidth * 0.03,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: widget.screenHeight * 0.002),
                                    Text(
                                      currentComments[index]['comment'] ??
                                          'No comment provided',
                                      style: TextStyle(
                                        fontSize: widget.screenWidth * 0.035,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: widget.screenHeight * 0.005,
                                        bottom: widget.screenHeight * 0.005,
                                      ),
                                      child: Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(0, 0),
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Text(
                                              'Reply',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    widget.screenWidth * 0.03,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '―',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize:
                                                  widget.screenWidth * 0.03,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(0, 0),
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Text(
                                              'View 2 more replies',
                                              style: TextStyle(
                                                fontSize:
                                                    widget.screenWidth * 0.03,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),

            // Comment Input Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.screenWidth * 0.04,
                vertical: widget.screenHeight * 0.01,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // Avatar
                  ClipOval(
                      child: Image.asset(
                    widget.avatarUrl?.isNotEmpty == true
                        ? widget.avatarUrl!
                        : widget.defaultAvatar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )),
                  SizedBox(width: widget.screenWidth * 0.03),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.screenWidth * 0.03,
                          vertical: widget.screenHeight * 0.0002),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade200, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: commentController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText:
                                    'Add a comment for ${widget.username}',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: widget.screenWidth * 0.02),

                          // Emoji Icon
                          GestureDetector(
                            onTap: () {
                              //Logic Emoij Icon
                            },
                            child: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.grey.shade600,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: widget.screenWidth * 0.03),

                  // Camera Icon
                  GestureDetector(
                    onTap: () {
                      //Logic Camera Icon
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
