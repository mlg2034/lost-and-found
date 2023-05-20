import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tamyrlan/bloc/exception/exception_extensions.dart';
import 'package:tamyrlan/bloc/util/exception.dart';
import 'package:tamyrlan/domain/repository/auth_repository.dart';

import '../../data/db/box_helper.dart';
import '../../data/db/entity/token_entity.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginState()) {
    on<LoginCodeRequested>(_onCodeRequested);
    on<CodeSent>(_onCodeSent);
  }


  Future<void> _onCodeRequested(
    LoginCodeRequested event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LoginStatus.inProgress,));
      await _authRepository.sendSms(event.phone);
      emit(state.copyWith(status: LoginStatus.codeRequested,));
    } on Exception catch (e) {
      emit(state.copyWith(status: LoginStatus.failure,
        failureMessage: ExceptionParser.parseNetworkException(e),
      ));
    }
  }

  Future<void> _onCodeSent(CodeSent event, Emitter emit) async {
    try {
      late TokenEntity tokens;
      emit(state.copyWith(status: LoginStatus.inProgress));
      tokens = await _authRepository.verifyCode(event.phone, event.code);
      debugPrint(tokens.toString());
      BoxHelper.saveToken(tokens);
      emit(state.copyWith(status: LoginStatus.successful));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        failureMessage: e.parseMessage(),
      ));
    }
  }

  // Future<void> _onLoggedIn(
  //   Emitter<LoginState> emit,
  // ) async {
  //   try {
  //     emit(state.copyWith(status: LoginStatus.inProgress,));
  //     await _authRepository.noLoginVerify();
  //     emit(state.copyWith(status: LoginStatus.successful,));
  //   } on Exception catch (e) {
  //     emit(state.copyWith(status: LoginStatus.failure,
  //       failureMessage: ExceptionParser.parseNetworkException(e),
  //     ));
  //   }
  // }
}
