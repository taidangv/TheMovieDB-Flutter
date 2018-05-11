import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/widgets/VoteWidget.dart';
import 'TitleOverlayWidget.dart';
import 'BackdropWidget.dart';

class MovieItemWidget extends StatelessWidget {
  MovieItemWidget({Key key, this.movie, this.imgConfig}) : super(key: key);

  final Movie movie;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 210.0,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          BackdropWidget(movie: movie, imgConfig: imgConfig),
          _buildOverlayMovieName(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[VoteWidget(movie.vote, movie.releaseDate)],
          )
        ],
      ),
    );
  }

  Widget _buildOverlayMovieName() {
    return Container(
      child: TitleOverlayWidget(movie: movie),
      margin: EdgeInsets.only(top: 145.0),
    );
  }
}
