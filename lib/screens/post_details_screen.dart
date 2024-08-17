import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_circle/models/app_data.dart';
import '../controllers/post_controller.dart';
import '../models/post.dart';
import '../widgets/comment_card.dart';
import 'user_profile_screen.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;
  PostDetailsScreen({super.key, required this.post});
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    // Fetch user details and post comments
    postController.fetchUserDetails(post.userId);
    postController.fetchPostComments(post.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Post Details'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reactive user display
            Obx(() {
              final user = AppData.instance.getSelectedUser();
              return InkWell(
                onTap: () {
                  Get.to(UserProfileScreen(user: user));
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blueGrey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Author: ${user.name}",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            // Post title
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Post body
            Text(
              post.body,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                ),
              ),
              child: const SizedBox(height: 10),
            ),
            const SizedBox(height: 16),
            const Text(
              'Comments:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Reactive comments display
            Obx(() {
              final comments = AppData.instance.getPostComments();
              return Expanded(
                child: comments.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return CommentWidget(
                            comment: comments[index],
                          );
                        },
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
 