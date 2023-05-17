import 'package:dio/dio.dart';
import 'package:tamyrlan/data/network/response/registration_response.dart';
import 'package:tamyrlan/domain/model/token.dart';
import 'package:tamyrlan/domain/model/user.dart';

class AuthNetworkProvider {
  final Dio _dio;

  AuthNetworkProvider(this._dio);

  Future sendSms(String phone) async {
    await _dio.post('/api/accounts/verify-phone/', data: {'phone': phone});
  }

  Future<RegistrationResponse> startUser() async {
    final response = await _dio.get('/api/accounts/start_user');
    dynamic userData = response.data['user'];
    final user = User(
      id: userData['id'],
      phone: userData['phone'],
      fullName: userData['fullName'],
    );
    dynamic tokenData = response.data['token'];
    final token = Token(
      access: tokenData['access'],
      refresh: tokenData['refresh'],
    );
    return RegistrationResponse(user, token);
  }

  Future<RegistrationResponse> verifyCode(String phone, String code) async {
    final response = await _dio.post(
      '/api/accounts/register/',
      data: {'phone': phone, 'code': code},
    );
    dynamic userData = response.data['user'];
    final user = User(
      id: userData['id'],
      phone: userData['phone'],
      fullName: userData['fullName'],
    );
    dynamic tokenData = response.data['token'];
    final token = Token(
      access: tokenData['access'],
      refresh: tokenData['refresh'],
    );
    return RegistrationResponse(user, token);
  }
}
