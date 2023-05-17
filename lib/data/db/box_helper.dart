import 'package:hive_flutter/hive_flutter.dart';
import 'package:tamyrlan/data/db/entity/token_entity.dart';
import 'package:tamyrlan/data/db/entity/user_entity.dart';
import 'package:tamyrlan/data/db/entity_extensions.dart';
import 'package:tamyrlan/data/db/hives.dart';
import 'package:tamyrlan/domain/model/user.dart';

class BoxHelper {

  static Future saveOnBoardingShow(bool show) async {
    await Hive.box(Hives.boxOnBoardingShow).put(Hives.onBoardingShow, show);
  }

  static bool getOnBoardingShow() {
    return Hive.box(Hives.boxOnBoardingShow)
        .get(Hives.onBoardingShow, defaultValue: false);
  }

  static bool hasToken() {
    final box = Hive.box<TokenEntity>(Hives.boxToken);
    return box.get(Hives.keyToken) != null;
  }

  static bool isLoggedIn() {
    return Hive.box(Hives.boxSettings)
        .get(Hives.keyIsLoggedIn, defaultValue: false);
  }

  static User getProfile() {
    return Hive.box<UserEntity>(Hives.boxUsers).get(Hives.keyMyUser)!.toModel();
  }

  static bool isProfile(int userId) {
    return getProfile().id == userId;
  }

  static Future clearAll() async {
    // need delete all keys in boxSettings except lang
    await Hive.box(Hives.boxSettings).delete(Hives.keyIsLoggedIn);
    await Hive.box<UserEntity>(Hives.boxUsers).clear();
    await Hive.box<TokenEntity>(Hives.boxToken).clear();
  }
}
