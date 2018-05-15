import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/widgets/ShadowText.dart';

class TitleOverlayWidget extends StatelessWidget {
  TitleOverlayWidget({this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildTitle(),
          _buildSubtitle(),
        ],
      ),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 7.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x00000000), Color(0x99000000)],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return ShadowText(
      movie.name,
      style: TextStyle(
        fontSize: 23.0,
        fontWeight: FontWeight.w100,
      ),
    );
  }

  Widget _buildSubtitle() {
    return ShadowText(
      movie.genres.map((g) => g.name).join(', '),
      style: TextStyle(
        color: Colors.grey[400],
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
