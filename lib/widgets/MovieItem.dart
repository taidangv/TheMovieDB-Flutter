import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Movie.dart';

class MovieItem extends StatelessWidget {
  MovieItem({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Center(
        child: Text(
          movie.name,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
