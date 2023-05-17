import 'package:hive/hive.dart';
import 'package:tamyrlan/data/db/entity/token_entity.dart';
import 'package:tamyrlan/data/db/entity/user_entity.dart';
import 'package:tamyrlan/data/db/entity_extensions.dart';
import 'package:tamyrlan/data/db/hives.dart';
import 'package:tamyrlan/domain/model/token.dart';
import 'package:tamyrlan/domain/model/user.dart';

class AuthDatabaseProvider {
  Future saveUser(User user) async {
    await Hive.box<UserEntity>(Hives.boxUsers)
        .put(Hives.keyMyUser, user.toEntity());
  }

  Future saveToken(Token token) async {
    await Hive.box<TokenEntity>(Hives.boxToken)
        .put(Hives.keyToken, token.toEntity());
  }

  Future setIsLoggedIn() async {
    await Hive.box(Hives.boxSettings).put(Hives.keyIsLoggedIn, true);
  }
}
