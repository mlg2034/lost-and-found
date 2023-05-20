import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tamyrlan/bloc/exception/exception_extensions.dart';
import 'package:tamyrlan/data/db/box_helper.dart';
import 'package:tamyrlan/domain/model/user.dart';
import 'package:tamyrlan/domain/repository/user_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;

  ProfileBloc(this._userRepository) : super(ProfileState()) {
    on<ProfileStarted>(_onStarted);
  }

  Future<void> _onStarted(ProfileStarted event, Emitter emit) async {
    try {
      emit(state.copyOf(state: ProfileStateType.inProgress));
      var user = await _userRepository.getUserProfile();
      BoxHelper.setAvatarUrl(user.avatar);
      emit(state.copyOf(state: ProfileStateType.success, user: user));
    } on Exception catch (e) {
      emit(state.copyOf(
        state: ProfileStateType.failure,
        failureMessage: e.parseMessage(),
      ));
    }
  }
}
