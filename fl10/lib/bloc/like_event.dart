import 'package:equatable/equatable.dart';

abstract class LikeEvent extends Equatable {
  const LikeEvent();

  @override
  List<Object> get props => [];
}

class LikeButtonPressed extends LikeEvent {
  final String title;

  LikeButtonPressed(this.title);

  @override
  List<Object> get props => [title];

  @override
  String toString() => 'LikeButtonPressed { title: $title }';
}
