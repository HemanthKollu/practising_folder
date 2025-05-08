import 'package:flutter/material.dart';

import 'api_service.dart';

class ApiUi extends StatefulWidget {
  const ApiUi({super.key});

  @override
  State<ApiUi> createState() => _ApiUiState();
}

class _ApiUiState extends State<ApiUi> {
  final ApiService apiService = ApiService();
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    final data = await apiService.fetchPosts();
    setState(() {
      posts = data.take(5).toList(); // only show first 5
    });
  }

  Future<void> addPost() async {
    await apiService.createPost({
      'title': 'New Flutter Post',
      'body': 'This is from our app!',
      'userId': 1,
    });
    await loadPosts();
  }

  Future<void> updateFirstPost() async {
    await apiService.updatePost(1, {
      'id': 1,
      'title': 'Updated Title',
      'body': 'Updated body content',
      'userId': 1,
    });
    await loadPosts();
  }

  Future<void> deleteFirstPost() async {
    await apiService.deletePost(1);
    await loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Demo'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: addPost),
          IconButton(icon: Icon(Icons.edit), onPressed: updateFirstPost),
          IconButton(icon: Icon(Icons.delete), onPressed: deleteFirstPost),
        ],
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                );
              },
            ),
    );
  }
}