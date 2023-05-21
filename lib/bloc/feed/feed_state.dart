part of 'feed_bloc.dart';

enum FeedStatus { initial, inProgress, successful, failure }

class FeedState extends Equatable {
  final FeedStatus status;
  final List<Post>? posts;
  final String? failureMessage;

  FeedState copyWith({
    FeedStatus? status,
    List<Post>? posts,
    String? failureMessage,
  }) {
    return FeedState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  const FeedState({
    this.status = FeedStatus.initial,
    this.posts,
    this.failureMessage,
  });

  @override
  List<Object?> get props => [status, posts, failureMessage];
}
