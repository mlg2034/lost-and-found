import 'package:equatable/equatable.dart';
import 'package:tamyrlan/domain/model/user.dart';

class Post extends Equatable {
  final int id;
  final User? user;
  final String? photo;
  final String? description;
  final String? title;
  final String? city;
  final String? address;
  final String? date;
  final String? name;
  final String? phone;
  final String? email;
  final double? latitude;
  final double? longitude;

  const Post({
    required this.id,
    this.user,
    this.photo,
    this.description,
    this.title,
    this.city,
    this.address,
    this.date,
    this.name,
    this.phone,
    this.email,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
    id,
    user,
    photo,
    description,
    title,
    city,
    address,
    date,
    name,
    phone,
    email,
    latitude,
    longitude,
  ];
}
