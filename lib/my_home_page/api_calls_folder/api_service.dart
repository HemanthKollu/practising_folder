import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> createPost(Map<String, dynamic> post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post),
    );
    if (response.statusCode != 201) throw Exception('Failed to create post');
  }

  Future<void> updatePost(int id, Map<String, dynamic> post) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post),
    );
    if (response.statusCode != 200) throw Exception('Failed to update post');
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));
    if (response.statusCode != 200) throw Exception('Failed to delete post');
  }
}
