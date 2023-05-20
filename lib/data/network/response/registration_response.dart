import 'package:tamyrlan/domain/model/token.dart';
import 'package:tamyrlan/domain/model/user.dart';

class RegistrationResponse {
  User user;
  Token token;

  RegistrationResponse(this.user, this.token);
}
