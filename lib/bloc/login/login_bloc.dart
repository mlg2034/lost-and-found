import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tamyrlan/bloc/util/exception.dart';
import 'package:tamyrlan/domain/repository/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginStatus.initial as LoginState) {
    on<LoginCodeRequested>(_onCodeRequested);
  }


  Future<void> _onCodeRequested(
    LoginCodeRequested event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginStatus.inProgress as LoginState);
      await _authRepository.sendSms(event.phone);
      emit(state.copyWith(status: LoginStatus.successful,));
    } on Exception catch (e) {
      emit(state.copyWith(status: LoginStatus.failure,
        failureMessage: ExceptionParser.parseNetworkException(e),
      ));
    }
  }

  Future<void> _onNoLoggedIn(
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LoginStatus.inProgress,));
      await _authRepository.noLoginVerify();
      emit(state.copyWith(status: LoginStatus.successful,));
    } on Exception catch (e) {
      emit(state.copyWith(status: LoginStatus.failure,
        failureMessage: ExceptionParser.parseNetworkException(e),
      ));
    }
  }
}
