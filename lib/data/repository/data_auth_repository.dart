import 'package:fresh_dio/fresh_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tamyrlan/data/provider/auth_database_provider.dart';
import 'package:tamyrlan/data/provider/auth_network_provider.dart';
import 'package:tamyrlan/domain/repository/auth_repository.dart';

class DataAuthRepository extends AuthRepository {
  final AuthNetworkProvider _authNetworkProvider;
  final _authDatabaseProvider = AuthDatabaseProvider();

  DataAuthRepository(Dio dio) : _authNetworkProvider = AuthNetworkProvider(dio);

  @override
  Future sendSms(String phone) async {
    return _authNetworkProvider.sendSms(phone);
  }

  @override
  Future verifyCode(String phone, String code) async {
    final response = await _authNetworkProvider.verifyCode(phone, code);
    GetIt.I<Fresh>().setToken(OAuth2Token(
      accessToken: response.token.access,
      refreshToken: response.token.refresh,
    ));
    await _authDatabaseProvider.saveUser(response.user);
    await _authDatabaseProvider.saveToken(response.token);
    await _authDatabaseProvider.setIsLoggedIn();
  }

  @override
  Future noLoginVerify() async {
    final response = await _authNetworkProvider.startUser();
    GetIt.I<Fresh>().setToken(OAuth2Token(
      accessToken: response.token.access,
      refreshToken: response.token.refresh,
    ));
    await _authDatabaseProvider.saveUser(response.user);
    await _authDatabaseProvider.saveToken(response.token);
  }
}
