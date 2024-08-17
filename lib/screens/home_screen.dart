import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../models/app_data.dart';
import '../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final posts = AppData.instance.getPosts();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Subtle background color
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
        // shape: const RoundedRectangleBorder(),
      ),
      body: Obx(
        () {
          // Loading Indicator with a styled look
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

          // Main content with padding and ListView
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                var post = posts[index];
                return PostCard(
                  post: post,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
