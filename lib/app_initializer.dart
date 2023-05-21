import 'package:dio/dio.dart';
import 'package:tamyrlan/data/db/entity/token_entity.dart';
import 'package:tamyrlan/data/db/hive_token_storage.dart';
import 'package:tamyrlan/data/db/hives.dart';
import 'package:flutter/foundation.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

class AppInitializer {
  static const String _host = 'http://10.201.0.175:8000/';

  static Future<Dio> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TokenEntityAdapter());
    await Hive.openBox(Hives.boxSettings);
    await Hive.openBox<TokenEntity>(Hives.boxToken);
    await Hive.openBox(Hives.boxUsers);

    Fresh fresh = Fresh.oAuth2(
      tokenStorage: HiveTokenStorage(),
      refreshToken: refreshToken,
      shouldRefresh: (response) => response?.statusCode == 401,
      tokenHeader: (token) => {
        'Authorization': 'Token ${token.accessToken}',
      },
    );
    GetIt.I.registerSingleton<Fresh>(fresh);
    BaseOptions options = BaseOptions(
      baseUrl: _host,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    );

    final dio = Dio(options);
    dio.interceptors.add(fresh);
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }

  static Future<OAuth2Token> refreshToken(
      OAuth2Token? token,
      Dio httpClient,
      ) async {
    final response = await httpClient.post(
      '${_host}api_user/refresh_token/',
      data: {
        'refresh': token?.refreshToken,
      },
    );
    return OAuth2Token(
      accessToken: response.data['access'],
      refreshToken: response.data['refresh'],
    );
  }
}
