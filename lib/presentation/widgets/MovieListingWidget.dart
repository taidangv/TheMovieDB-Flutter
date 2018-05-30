import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/redux/containers/movie_item_container.dart';

class MovieListingWidget extends StatelessWidget {
  MovieListingWidget(this.movies, this.imgConfig);

  final List<Movie> movies;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, idx) {
          Movie m = movies[idx];
          return MovieItemContainer(movie: m);
        });
  }
}
