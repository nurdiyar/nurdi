import 'package:equatable/equatable.dart';

abstract class LikeState extends Equatable {
  const LikeState();

  @override
  List<Object> get props => [];
}

class LikeInitial extends LikeState {}

class LikeUpdatedState extends LikeState {
  final int likeCount;

  LikeUpdatedState(this.likeCount);

  @override
  List<Object> get props => [likeCount];

  @override
  String toString() => 'LikeUpdatedState { likeCount: $likeCount }';
}
