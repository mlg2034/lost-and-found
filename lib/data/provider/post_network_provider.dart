import 'package:dio/dio.dart';
import 'package:format/format.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamyrlan/domain/model/post.dart';
import 'package:tamyrlan/domain/model/user.dart';

class PostNetworkProvider {
  final Dio _dio;

  PostNetworkProvider(this._dio);

  // Future getPosts(String phone) async {
  //   await _dio.post('api_user/get_posts/', data: {'phone': phone});
  // }

  Future<Post> getPost(int id) async {
    var response = await _dio.get(
      'api_post/get_post/',
      queryParameters: {'post_id': id},
    );
    return _parsePost(response.data);
  }

  Future<List<Post>> getPosts() async {
    var response = await _dio.get(
      'api_post/get_posts/',
    );
    return (response.data as List).map((e) => _parsePosts(e)).toList();
  }

  Future<Post> createPost(
      Post post) async {
    var response = await _dio.get(
      'api_user/create_post/',
      data: {
        'photo': post.photo,
        'title': post.title,
        'description': post.description,
        'name': post.name,
        'phone': post.phone,
        'email': post.email,
        'latitude': post.latitude,
        'longitude': post.longitude,
      },
    );
    return _parsePost(response.data);
  }

  Post _parsePost(dynamic e) {
    DateTime date = DateTime.parse(e['date'].toString());
    return Post(
      id: e['id'],
      title: e['title'],
      description: e['description'],
      user: _parseUser(e['user']),
      date:
          '{:02d}.{:02d}.{:02d}'.format(date.day, date.month, date.year % 100),
      photo: e['photo'].toList(),
      phone: e['phone'],
      email: e['email'],
      latitude: e['latitude'],
      longitude: e['longitude'],
    );
  }

  Post _parsePosts(dynamic e) {
    DateTime date = DateTime.parse(e['date'].toString());
    return Post(
      id: e['id'],
      title: e['title'],
      description: e['description'],
      date:
          '{:02d}.{:02d}.{:02d}'.format(date.day, date.month, date.year % 100),
      photo: e['photo'],
    );
  }
  
  User _parseUser(dynamic e){
    return User(
      fullName: e['full_name'],
      phone: e['phone'],
      id: e['id'],
      avatar: e['avatar'],
    );
  }
// Future<RegistrationResponse> startUser() async {
//   final response = await _dio.get('/api/accounts/start_user');
//   dynamic userData = response.data['user'];
//   final user = User(
//     id: userData['id'],
//     phone: userData['phone'],
//     fullName: userData['fullName'],
//   );
//   dynamic tokenData = response.data['token'];
//   final token = Token(
//     access: tokenData['access'],
//     refresh: tokenData['refresh'],
//   );
//   return RegistrationResponse(user, token);
// }
//
// Future<RegistrationResponse> verifyCode(String phone, int code) async {
//   final response = await _dio.post(
//     '/api_user/register/',
//     data: {'phone': phone, 'code': code},
//   );
//   dynamic userData = response.data['user'];
//   final user = User(
//     id: userData['id'],
//     phone: userData['phone'],
//     fullName: userData['fullName'],
//   );
//   dynamic tokenData = response.data['token'];
//   final token = Token(
//     access: tokenData['access'],
//     refresh: tokenData['refresh'],
//   );
//   return RegistrationResponse(user, token);
// }
}
