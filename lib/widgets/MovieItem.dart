import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'MovieOverlayInfo.dart';
import 'MovieBackdrop.dart';

class MovieItem extends StatelessWidget {
  MovieItem({Key key, this.movie, this.imgConfig}) : super(key: key);

  final Movie movie;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        fit: StackFit.passthrough,
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          MovieBackdrop(movie: movie, imgConfig: imgConfig),
          MovieOverlayInfo(movie: movie),
        ],
      ),
    );
  }
}
