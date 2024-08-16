import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/post.dart';
import '../screens/post_details_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(PostDetailsScreen(
          post: post,
        ));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with simple modern style
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10.0),
              // Body with limited lines and 'Read More'
              Text(
                post.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8.0),
              // Simple Read More text
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Read More',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
