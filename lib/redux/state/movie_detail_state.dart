import 'package:meta/meta.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';

@immutable
class MovieDetailState {
  final Movie overview;
  final MovieDetails details;

  MovieDetailState({this.overview, this.details});

  MovieDetailState copyWith({Movie overview, MovieDetails details}) {
    return MovieDetailState(
      overview: overview ?? this.overview,
      details: details ?? this.details,
    );
  }

  factory MovieDetailState.initWithOverview(Movie overview) =>
      MovieDetailState(overview: overview);
}
