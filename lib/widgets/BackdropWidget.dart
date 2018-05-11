import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';

class BackdropWidget extends StatelessWidget {
  BackdropWidget({this.movie, this.imgConfig});

  final Movie movie;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgConfig.buildBackdropUrl(movie.backdrop),
      fit: BoxFit.cover,
    );
  }
}
