part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginCodeRequested extends LoginEvent {
  final String phone;

  const LoginCodeRequested(this.phone);

  @override
  List<Object?> get props => [phone];
}

class CodeSent extends LoginEvent {
  final String phone;
  final String code;

  const CodeSent(this.phone, this.code);

  @override
  List<Object?> get props => [phone, code];
}
