import 'package:equatable/equatable.dart';

class Token extends Equatable {
  String access;
  String refresh;

  Token({required this.access, required this.refresh});

  @override
  List<Object?> get props => [access, refresh];
}