import 'package:hive_flutter/hive_flutter.dart';
import 'package:tamyrlan/data/db/entity/token_entity.dart';
import 'package:tamyrlan/data/db/hives.dart';
import 'package:tamyrlan/domain/model/user.dart';

class BoxHelper {

  static bool hasToken() {
    final box = Hive.box<TokenEntity>(Hives.boxToken);
    return box.get(Hives.keyToken) != null;
  }

  static void saveToken(TokenEntity token) {
    Hive.box<TokenEntity>(Hives.boxToken).put(Hives.keyToken, token);
  }

  static bool isLoggedIn() {
    return Hive.box(Hives.boxSettings)
        .get(Hives.keyIsLoggedIn, defaultValue: false);
  }

  static Future clearAll() async {
    // need delete all keys in boxSettings except lang
    await Hive.box(Hives.boxSettings).delete(Hives.keyIsLoggedIn);
    await Hive.box<TokenEntity>(Hives.boxToken).clear();
  }

  static void setAvatarUrl(String? url) {
    Hive.box(Hives.boxUsers).put(Hives.keyUserAvatar, url);
  }
}
