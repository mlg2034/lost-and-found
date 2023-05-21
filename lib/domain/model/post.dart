import 'package:equatable/equatable.dart';

class Post extends Equatable {
  int id;
  List? user;
  String? photo;
  String? description;
  String? title;
  String? city;
  String? address;
  String? date;
  String? name;
  String? phone;
  String? email;
  double? latitude;
  double? longitude;

  Post({
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
