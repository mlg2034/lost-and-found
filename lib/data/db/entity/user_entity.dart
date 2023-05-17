import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:tamyrlan/domain/model/user.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String fullName;

  UserEntity(
      this.id,
      this.phone,
      this.fullName,
      );

  UserEntity.from(User user)
      : this(
    user.id,
    user.phone,
    user.fullName,
  );
}
