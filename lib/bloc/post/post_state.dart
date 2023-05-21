part of 'post_bloc.dart';

enum PostStatus { initial, inProgress, successful, failure }

class PostState extends Equatable {
  final PostStatus status;
  final Post? post;
  final String? failureMessage;

  PostState copyWith({
    PostStatus? status,
    Post? post,
    String? failureMessage,
  }) {
    return PostState(
      status: status ?? this.status,
      post: post ?? this.post,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  const PostState({
    this.status = PostStatus.initial,
    this.post,
    this.failureMessage,
  });

  @override
  List<Object?> get props => [status, post, failureMessage];
}
