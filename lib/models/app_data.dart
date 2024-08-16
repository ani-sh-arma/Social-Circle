class AppData {
  AppData._privateConstructor();

  static final AppData _instance = AppData._privateConstructor();

  static AppData get instance => _instance;

  List<Map<String, dynamic>> _posts = [];
  Map<String, dynamic>? _selectedPost;
  Map<String, dynamic>? _selectedUser;

  void setPosts(List<Map<String, dynamic>> posts) {
    _posts = posts;
  }

  List<Map<String, dynamic>> getPosts() {
    return _posts;
  }

  void setSelectedPost(Map<String, dynamic> post) {
    _selectedPost = post;
  }

  Map<String, dynamic>? getSelectedPost() {
    return _selectedPost;
  }

  void setSelectedUser(Map<String, dynamic> user) {
    _selectedUser = user;
  }

  Map<String, dynamic>? getSelectedUser() {
    return _selectedUser;
  }
}
