part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class GetPost extends PostEvent {

  final int id;

  const GetPost(this.id);

  @override
  List<Object?> get props => [id];
}
