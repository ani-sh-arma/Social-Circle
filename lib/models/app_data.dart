import 'package:get/get.dart';
import 'comment.dart';
import 'post.dart';
import 'user.dart';

class AppData extends GetxController {
  AppData._privateConstructor();

  static final AppData _instance = AppData._privateConstructor();

  static AppData get instance => _instance;

  final RxList<Post> _posts = <Post>[].obs;
  final RxList<Comment> _postComments = <Comment>[].obs;
  final Rx<Post> _selectedPost =
      Post(id: -1, title: '', body: '', userId: -1).obs;
  final Rx<User> _selectedUser = User(
          id: -1,
          name: '',
          username: '',
          email: '',
          address: Address(
              street: "",
              suite: "",
              city: "",
              zipcode: "",
              geo: Geo(lat: "", lng: "")),
          phone: '',
          website: '',
          company: Company(name: "", catchPhrase: "", bs: ""))
      .obs;

  void setPosts(List<Post> posts) {
    _posts.value = posts;
  }

  List<Post> getPosts() {
    return _posts;
  }

  void setPostComments(List<Comment> comments) {
    _postComments.value = comments;
  }

  List<Comment> getPostComments() {
    return _postComments;
  }

  void setSelectedPost(Post post) {
    _selectedPost.value = post;
  }

  Post getSelectedPost() {
    return _selectedPost.value;
  }

  void setSelectedUser(User user) {
    _selectedUser.value = user;
  }

  User getSelectedUser() {
    return _selectedUser.value;
  }
}
