import 'package:fresh_dio/fresh_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tamyrlan/data/provider/post_network_provider.dart';
import 'package:tamyrlan/domain/model/post.dart';

import '../../domain/repository/post_repository.dart';


class DataPostRepository extends PostRepository {
  final PostNetworkProvider _postNetworkProvider;

  DataPostRepository(Dio dio) : _postNetworkProvider = PostNetworkProvider(dio);

  @override
  Future<void> createPost(Post post) {
    return _postNetworkProvider.createPost(post);
  }

  @override
  Future<Post> getPost(int id) {
    return _postNetworkProvider.getPost(id);
  }

  @override
  Future<List<Post>> getPosts() {
    return _postNetworkProvider.getPosts();
  }

  @override
  Future<List<Post>> searchPosts(String query) {
    // TODO: implement searchPosts
    throw UnimplementedError();
  }

// @override
// Future noLoginVerify() async {
//   final response = await _authNetworkProvider.startUser();
//   GetIt.I<Fresh>().setToken(OAuth2Token(
//     accessToken: response.token.access,
//     refreshToken: response.token.refresh,
//   ));
// }
}
