import 'package:get/get.dart';
import 'package:social_circle/models/comment.dart';
import '../api/api_service.dart';
import '../models/app_data.dart';
import '../models/post.dart';
import '../models/user.dart';

class PostController extends GetxController {
  // var posts = [].obs;
  // var user = Rx<User>(
  //   User(
  //     name: '',
  //     email: '',
  //     id: -1,
  //     username: '',
  //     address: Address(
  //       street: "",
  //       suite: "",
  //       city: "",
  //       zipcode: "",
  //       geo: Geo(
  //         lat: "",
  //         lng: "",
  //       ),
  //     ),
  //     company: Company(
  //       name: "",
  //       catchPhrase: "",
  //       bs: "",
  //     ),
  //     phone: '',
  //     website: '',
  //   ),
  // );

  // var comments = [].obs;

  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  // Fetch posts from AppData
  Future<void> fetchPosts() async {
    List<Post> res = await apiService.fetchPosts();
    AppData.instance.setPosts(res);
    // posts.assignAll(AppData.instance.getPosts());
  }

  // Fetch selected user for the post
  Future<void> fetchUserDetails(int id) async {
    User res = await apiService.fetchUser(id);
    AppData.instance.setSelectedUser(res);
  }

  Future<void> fetchPostComments(int id) async {
    List<Comment> res = await apiService.fetchComments(id);
    AppData.instance.setPostComments(res);
  }
}
