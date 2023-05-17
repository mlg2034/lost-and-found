import 'package:tamyrlan/data/db/entity/token_entity.dart';
import 'package:tamyrlan/data/db/entity/user_entity.dart';
import 'package:tamyrlan/domain/model/token.dart';
import 'package:tamyrlan/domain/model/user.dart';

extension UserExtension on User {
  UserEntity toEntity() {
    return UserEntity(
      id,
      phone,
      fullName,
    );
  }
}

extension UserEntityExtension on UserEntity {
  User toModel() {
    return User(
      id: id,
      phone: phone,
      fullName: fullName,
    );
  }
}

extension TokenExtension on Token {
  TokenEntity toEntity() {
    return TokenEntity(access, refresh);
  }
}
