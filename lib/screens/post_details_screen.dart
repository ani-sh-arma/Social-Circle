import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../models/app_data.dart';
import '../models/post.dart';
import '../widgets/comment_card.dart';
import 'user_profile_screen.dart';

class PostDetailsScreen extends StatefulWidget {
  final Post post;
  const PostDetailsScreen({super.key, required this.post});

  @override
  // ignore: library_private_types_in_public_api
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final PostController postController = Get.put(PostController());
  late Future<void> _fetchCommentsFuture;
  final RxBool _hasError = false.obs;

  @override
  void initState() {
    super.initState();

    // Start loading user details and comments
    postController.fetchUserDetails(widget.post.userId);
    _fetchCommentsFuture =
        postController.fetchPostComments(widget.post.id).then((_) {
      // Successful fetch, no error
      _hasError.value = false;
    }).catchError((_) {
      // Handle error
      _hasError.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.post.body,
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
            Expanded(
              child: FutureBuilder<void>(
                future: _fetchCommentsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError || _hasError.value) {
                    return const Center(
                      child: Text(
                        'No comments',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  }

                  final comments = AppData.instance.getPostComments();
                  if (comments.isEmpty) {
                    return const Center(
                      child: Text(
                        'No comments',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return CommentWidget(
                        comment: comments[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
