import 'post.dart';

class AppData {
  AppData._privateConstructor();

  static final AppData _instance = AppData._privateConstructor();

  static AppData get instance => _instance;

  List<Post> _posts = [];
  Post? _selectedPost; // Change to Post type
  Map<String, dynamic>? _selectedUser;

  void setPosts(List<Post> posts) {
    _posts = posts;
  }

  List<Post> getPosts() {
    return _posts;
  }

  void setSelectedPost(Post post) {
    // Change to Post type
    _selectedPost = post;
  }

  Post? getSelectedPost() {
    // Change to Post type
    return _selectedPost;
  }

  void setSelectedUser(Map<String, dynamic> user) {
    _selectedUser = user;
  }

  Map<String, dynamic>? getSelectedUser() {
    return _selectedUser;
  }
}
