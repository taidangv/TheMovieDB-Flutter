import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/widgets/MovieItem.dart';

class MovieListing extends StatelessWidget {
  MovieListing(this.movies, this.imgConfig);

  final List<Movie> movies;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
        itemBuilder: (context, idx) {
          return _buildRow(movies[idx]);
        });
  }

  Widget _buildRow(Movie m) {
    return MovieItem(key: ObjectKey(m.id), movie: m, imgConfig: imgConfig);
  }
}
