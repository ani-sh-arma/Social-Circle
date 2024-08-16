import 'package:get/get.dart';
import '../models/app_data.dart';

class PostController extends GetxController {
  var posts = [].obs; // List of posts, observable for GetX
  var selectedPost = {}.obs;
  var selectedUser = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  // Fetch posts from AppData
  void fetchPosts() {
    posts.assignAll(AppData.instance.getPosts());
  }

  // Fetch selected post from AppData
  void fetchSelectedPost(int postId) {
    var post = posts.firstWhere((element) => element['id'] == postId);
    selectedPost.value = post;
    AppData.instance.setSelectedPost(post);
  }

  // Fetch selected user for the post
  void fetchUserDetails() {
    var user = {
      'name': 'John Doe',
      'email': 'john.doe@email.com',
      'id': selectedPost.value['userId']
    };
    selectedUser.value = user;
    AppData.instance.setSelectedUser(user);
  }
}
