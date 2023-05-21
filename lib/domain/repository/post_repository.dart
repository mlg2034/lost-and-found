import 'package:tamyrlan/domain/model/post.dart';

abstract class PostRepository {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
  Future<void> createPost(Post post);
  Future<List<Post>> searchPosts(String query);
}
