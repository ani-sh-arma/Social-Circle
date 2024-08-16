import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import 'user_profile_screen.dart';

class PostDetailsScreen extends StatelessWidget {
  final PostController postController = Get.find<PostController>();

  PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              postController.fetchUserDetails();
              Get.to(() => UserProfileScreen());
            },
          ),
        ],
      ),
      body: Obx(() {
        var post = postController.selectedPost;
        if (post.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(post['body'], style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text('Comments:'),
              // Dummy comments for simplicity
              const Text('- Great post!'),
              const Text('- Very informative.'),
            ],
          ),
        );
      }),
    );
  }
}
