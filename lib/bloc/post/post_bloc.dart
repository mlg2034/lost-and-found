import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tamyrlan/bloc/exception/exception_extensions.dart';
import 'package:tamyrlan/bloc/util/exception.dart';
import 'package:tamyrlan/domain/model/post.dart';
import 'package:tamyrlan/domain/repository/auth_repository.dart';
import '../../data/db/box_helper.dart';
import '../../domain/repository/post_repository.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(const PostState()) {
    on<GetPost>(_getPost);
  }


  Future<void> _getPost(
      GetPost event,
      Emitter<PostState> emit,
      ) async {
    try {
      emit(state.copyWith(status: PostStatus.inProgress,));
      var post = await _postRepository.getPost(event.id);
      emit(state.copyWith(status: PostStatus.successful, post: post));
    } on Exception catch (e) {
      emit(state.copyWith(status: PostStatus.failure,
        failureMessage: ExceptionParser.parseNetworkException(e),
      ));
    }
  }
}
