import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class UserProfileScreen extends StatelessWidget {
  final PostController postController = Get.find<PostController>();

  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Obx(() {
        var user = postController.selectedUser;
        if (user.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user['name']}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              Text('Email: ${user['email']}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('User ID: ${user['id']}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      }),
    );
  }
}
