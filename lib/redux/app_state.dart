import 'package:meta/meta.dart';
import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';

@immutable
class AppState {
  final bool splashLoading;
  final ImagesConfig imagesConfig;
  final List<Genre> genres;
  final List<Movie> movies;

  factory AppState.loading() => AppState(splashLoading: true);

  AppState({
    this.splashLoading = false,
    this.imagesConfig,
    this.genres = const [],
    this.movies = const [],
  });

  AppState copyWith(
      {bool splashLoading,
      ImagesConfig imagesConfig,
      List<Genre> genres,
      List<Movie> movies}) {
    return AppState(
      splashLoading: splashLoading ?? this.splashLoading,
      imagesConfig: imagesConfig ?? this.imagesConfig,
      genres: genres ?? this.genres,
      movies: movies ?? this.movies,
    );
  }
}
