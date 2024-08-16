import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Social Circle'),
      ),
      body: Obx(
        () {
          if (postController.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              var post = postController.posts[index];
              return PostCard(
                title: post.title,
                body: post.body,
              );
            },
          );
        },
      ),
    );
  }
}
