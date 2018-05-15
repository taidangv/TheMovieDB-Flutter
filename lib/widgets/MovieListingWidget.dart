import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/pages/MovieDetailsPage.dart';
import 'package:the_movie_db/widgets/MovieItemWidget.dart';

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
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MovieDetailsPage(m)));
            },
            child: _buildRow(m),
          );
        });
  }

  Widget _buildRow(Movie m) {
    return MovieItemWidget(
        key: ObjectKey(m.id), movie: m, imgConfig: imgConfig);
  }
}
