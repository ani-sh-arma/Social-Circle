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
        Get.to(PostDetailsScreen(post: post));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background
          border: Border(
            bottom: BorderSide(
              color: Colors.blueGrey[300]!, // Bottom border color
              width: 1.0, // Bottom border width
            ),
          ),
        ),
        child: Card(
          color: Colors.transparent, // Transparent background
          elevation: 0, // Remove card elevation to show border clearly
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10.0),
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
      ),
    );
  }
}