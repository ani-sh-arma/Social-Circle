import 'package:dio/dio.dart';
import '../exceptions/api_exception.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  ApiService() {
    _dio.options.baseUrl = _baseUrl;
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get('/posts');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw ApiException('Failed to load posts');
      }
    } on DioException catch (e) {
      throw ApiException(e.message.toString());
    } catch (e) {
      throw ApiException('Unexpected error occurred');
    }
  }

  Future<List<Comment>> fetchComments(int postId) async {
    try {
      final response = await _dio.get('/posts/$postId/comments');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Comment.fromJson(json)).toList();
      } else {
        throw ApiException('Failed to load comments');
      }
    } on DioException catch (e) {
      throw ApiException(e.message.toString());
    } catch (e) {
      throw ApiException('Unexpected error occurred');
    }
  }

  Future<User> fetchUser(int userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw ApiException('Failed to load user');
      }
    } on DioException catch (e) {
      throw ApiException(e.message.toString());
    } catch (e) {
      throw ApiException('Unexpected error occurred');
    }
  }

  Future<Post> addPost({
    required String title,
    required String body,
  }) async {
    const url = '/posts';

    try {
      final response = await _dio.post(
        url,
        data: {
          'userId': 1,
          'title': title,
          'body': body,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 201) {
        return Post.fromJson(response.data);
      } else {
        throw ApiException('Failed to add post');
      }
    } on DioException catch (e) {
      throw ApiException(e.message.toString());
    } catch (e) {
      throw ApiException('Unexpected error occurred');
    }
  }
}
