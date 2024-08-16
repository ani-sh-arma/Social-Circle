import 'package:get/get.dart';
import 'package:social_circle/api/api_service.dart';
import 'package:social_circle/models/post.dart';
import '../models/app_data.dart';

class PostController extends GetxController {
  var posts = [].obs; // List of posts, observable for GetX
  var selectedPost = {}.obs;
  var selectedUser = {}.obs;

  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  // Fetch posts from AppData
  Future<void> fetchPosts() async {
    List<Post> res = await apiService.fetchPosts();
    print(res);
    AppData.instance.setPosts(res);
    posts.assignAll(AppData.instance.getPosts());
  }

  // Fetch selected post from AppData
  void fetchSelectedPost(int postId) {
    var post = posts.firstWhere((element) => element.id == postId);
    selectedPost.value = post.toJson();
    AppData.instance.setSelectedPost(post.toJson());
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
