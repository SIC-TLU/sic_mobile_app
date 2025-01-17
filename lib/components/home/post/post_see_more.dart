import 'package:flutter/material.dart';

class PostSeeMore extends StatefulWidget {
  final String caption;
  final int maxLines;
  final Color seeMoreColor;

  const PostSeeMore({
    super.key,
    required this.caption,
    this.maxLines = 2,
    this.seeMoreColor = Colors.orange,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PostSeeMoreState createState() => _PostSeeMoreState();
}

class _PostSeeMoreState extends State<PostSeeMore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (isExpanded) {
              setState(() {
                isExpanded = false;
              });
            }
          },
          child: Text(
            widget.caption,
            maxLines: isExpanded ? null : widget.maxLines,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        if (!isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = true;
              });
            },
            child: Text(
              " See more",
              style: TextStyle(fontSize: 14, color: widget.seeMoreColor),
            ),
          ),
      ],
    );
  }
}
