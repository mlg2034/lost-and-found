import 'package:equatable/equatable.dart';

class User extends Equatable {
  int id;
  String phone;
  String fullName;
  String? email;
  String? avatar;
  String? address;

  User({
    required this.id,
    required this.phone,
    required this.fullName,
    this.avatar,
    this.address,
    this.email,
  });

  @override
  List<Object?> get props => [
    id,
    phone,
    fullName,
    address,
    avatar,
    email,
  ];
}
