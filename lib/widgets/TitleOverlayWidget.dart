import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Movie.dart';

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
          colors: [Color(0x00000000), Color(0xCF000000)],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      movie.name,
      style: TextStyle(
        fontSize: 23.0,
        color: Colors.white,
        fontWeight: FontWeight.w100,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      movie.genres.map((g) => g.name).join(', '),
      style: TextStyle(
        color: Colors.grey[300],
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
