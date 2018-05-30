import 'package:the_movie_db/model/Movie.dart';

class LoadMovieListAction {}

class MovieListLoadedAction {
  final List<Movie> movies;

  MovieListLoadedAction(this.movies);
}

class MovieListNotLoadedAction {
  dynamic error;

  MovieListNotLoadedAction(this.error);
}
