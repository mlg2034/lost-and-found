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

part 'feed_event.dart';

part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final PostRepository _postRepository;

  FeedBloc(this._postRepository) : super(const FeedState()) {
    on<GetPosts>(_getPosts);
  }


  Future<void> _getPosts(
      GetPosts event,
      Emitter<FeedState> emit,
      ) async {
    try {
      emit(state.copyWith(status: FeedStatus.inProgress,));
      var posts = await _postRepository.getPosts();
      emit(state.copyWith(status: FeedStatus.successful, posts: posts));
    } on Exception catch (e) {
      emit(state.copyWith(status: FeedStatus.failure,
        failureMessage: ExceptionParser.parseNetworkException(e),
      ));
    }
  }
}
