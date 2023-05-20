import 'package:tamyrlan/domain/model/user.dart';

abstract class UserRepository {
  Future<User> getUserProfile();
  Future<void> editUser(User user);
}
