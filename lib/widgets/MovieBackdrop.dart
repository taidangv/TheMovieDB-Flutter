import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';

class MovieBackdrop extends StatelessWidget {
  MovieBackdrop({this.movie, this.imgConfig});

  final Movie movie;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Image.network(
        imgConfig.buildBackdropUrl(movie.backdrop),
        fit: BoxFit.cover,
      ),
    );
  }
}
