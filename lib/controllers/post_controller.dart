import 'package:get/get.dart';
import '../api/api_service.dart';
import '../models/app_data.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

class PostController extends GetxController {
  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    List<Post> res = await apiService.fetchPosts();
    AppData.instance.setPosts(res);
  }

  Future<void> fetchUserDetails(int id) async {
    User res = await apiService.fetchUser(id);
    AppData.instance.setSelectedUser(res);
  }

  Future<void> fetchPostComments(int id) async {
    try {
      List<Comment> res = await apiService.fetchComments(id);
      AppData.instance.setPostComments(res);
    } catch (e) {
      rethrow;
    }
  }
}
