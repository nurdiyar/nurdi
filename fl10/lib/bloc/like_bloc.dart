import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:form_app/bloc/like_event.dart';
import 'package:form_app/bloc/like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  int likeCount = 0;

  LikeBloc() : super(LikeInitial());

  @override
  Stream<LikeState> mapEventToState(LikeEvent event) async* {
    if (event is LikeButtonPressed) {
      if (likeCount == 0) {
        likeCount = 1;
      } else {
        likeCount = 0;
      }
      yield LikeUpdatedState(likeCount);
    }
  }
}

