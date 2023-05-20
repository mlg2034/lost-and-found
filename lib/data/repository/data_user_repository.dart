import 'package:dio/dio.dart';
import 'package:tamyrlan/data/provider/user_network_provider.dart';
import 'package:tamyrlan/domain/model/user.dart';
import 'package:tamyrlan/domain/repository/user_repository.dart';

class DataUserRepository extends UserRepository{

  final UserNetworkProvider _userNetworkProvider;

  DataUserRepository(Dio dio) : _userNetworkProvider = UserNetworkProvider(dio);

  @override
  Future<void> editUser(User user) {
    return _userNetworkProvider.editUser(user);
  }

  @override
  Future<User> getUserProfile() {
    return _userNetworkProvider.getUserProfile();
  }

}