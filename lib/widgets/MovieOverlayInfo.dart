import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Movie.dart';

class MovieOverlayInfo extends StatelessWidget {
  MovieOverlayInfo({this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildVote(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      movie.name,
      style: TextStyle(
        fontSize: 22.0,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Widget _buildVote() {
    return Container(
      child: Text(
        'IMDB ${movie.vote.toString()}',
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
