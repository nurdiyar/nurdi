import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/bloc/like_bloc.dart';
import 'package:form_app/bloc/like_event.dart';
import 'package:form_app/bloc/like_state.dart';
import 'package:like_button/like_button.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikeBloc(),
      child: MainPageContent(),
    );
  }
}

class MainPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: ListView(
          children: <Widget>[
            buildListItem(context, 'photo1'),
            buildListItem(context, 'photo2'),
            buildListItem(context, 'Photo3'),
            buildListItem(context, 'photo4'),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context, String title) {
    final likeBloc = BlocProvider.of<LikeBloc>(context);

    return BlocBuilder<LikeBloc, LikeState>(
      builder: (context, state) {
        return ListTile(
          title: Text(title),
          leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: LikeButton(
              size: 20,
              circleColor: const CircleColor(
                start: Color(0xff00ddff),
                end: Color(0xff0099cc),
              ),
              bubblesColor: const BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                if (state is LikeUpdatedState) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 20,
                  );
                }
                return CircularProgressIndicator();
              },
              likeCount: (state is LikeUpdatedState) ? state.likeCount : 0,
              likeCountPadding: EdgeInsets.only(left: 6),
              onTap: (isLiked) async {
                if (isLiked) {
                  likeBloc.add(LikeButtonPressed(title));
                  return false;
                } else {
                  likeBloc.add(LikeButtonPressed(title));
                  return true;
                }
              },
            ),
          ),
        );
      },
    );
  }
}
