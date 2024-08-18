import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../controllers/post_controller.dart';
import '../models/app_data.dart';
import '../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final ApiService apiService = ApiService();

  HomePage({super.key});

  void _showAddCommentDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Comment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final title = titleController.text;
                final body = bodyController.text;

                if (title.isNotEmpty && body.isNotEmpty) {
                  try {
                    final post =
                        await apiService.addPost(title: title, body: body);
                    AppData.instance
                        .setPosts([...AppData.instance.getPosts(), post]);
                    Get.snackbar(
                      'Success',
                      'Post Added.',
                    );
                  } catch (e) {
                    Get.snackbar(
                      'Error',
                      'Something went wrong. Please try again later.',
                    );
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                } else {
                  Get.snackbar(
                    'Error',
                    'Title and Body cannot be empty.',
                  );
                }
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 8,
        title: const Text(
          'Social Circle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final posts = AppData.instance.getPosts();
        if (posts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.blue[300],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Fetching posts...",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[posts.length - index - 1];
              return PostCard(post: post);
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCommentDialog(context),
        backgroundColor: Colors.blue[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
