part of 'login_bloc.dart';

enum LoginStatus { initial, inProgress, successful, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? failureMessage;

  LoginState copyWith({LoginStatus? status, String? failureMessage}) {
    return LoginState(
      status: status ?? this.status,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  const LoginState({
    this.status = LoginStatus.initial,
    this.failureMessage,
  });

  @override
  List<Object?> get props => [status, failureMessage];
}
