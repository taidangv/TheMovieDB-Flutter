import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';

class LoadMovieDetailAction {
  final Movie overview;

  LoadMovieDetailAction(this.overview);
}

class MovieDetailLoadedAction {
  final MovieDetails movieDetails;

  MovieDetailLoadedAction(this.movieDetails);
}

class MovieDetailNotLoadedAction {
  final dynamic error;

  MovieDetailNotLoadedAction(this.error);
}

class LoadCastsOfMovieAction {
  final int movieId;

  LoadCastsOfMovieAction(this.movieId);
}

class CastsLoadedAction {
  final List<Cast> casts;

  CastsLoadedAction(this.casts);
}

class CastsNotLoadedAction {
  dynamic error;

  CastsNotLoadedAction(this.error);
}
