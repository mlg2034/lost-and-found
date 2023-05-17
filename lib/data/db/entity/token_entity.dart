import 'package:hive/hive.dart';

part 'token_entity.g.dart';

@HiveType(typeId: 2)
class TokenEntity {
  @HiveField(0)
  final String access;
  @HiveField(1)
  final String refresh;

  TokenEntity(this.access, this.refresh);
}