import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Movie.dart';

class MovieOverlayInfo extends StatelessWidget {
  MovieOverlayInfo({this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return _buildGradientContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildSubtitle(),
        ],
      ),
      EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0, bottom: 7.0),
    );
  }

  Widget _buildGradientContainer(Widget child, EdgeInsets padding) {
    return Container(
      child: child,
      padding: padding,
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
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Container(
      child: Text(
        _getGenresDisplay(),
        style: TextStyle(
          color: Colors.grey[300],
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }

  String _getGenresDisplay() {
    return movie.genres.map((e) {
      return e.name;
    }).join(', ');
  }
}
