import 'package:meta/meta.dart';
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/redux/state/movie_detail_state.dart';

@immutable
class AppState {
  final bool initialDataDownloading;
  final ImagesConfig imagesConfig;

  final bool moviesDownloading;
  final List<Movie> homeMovies;

  final MovieDetailState movieDetailState;
  final List<Cast> castsOfSpecifiedMovie;

  AppState({
    this.initialDataDownloading = false,
    this.imagesConfig,
    this.moviesDownloading = false,
    this.homeMovies,
    this.movieDetailState,
    this.castsOfSpecifiedMovie,
  });

  AppState copyWith({
    bool initialDataDownloading,
    ImagesConfig imagesConfig,
    bool moviesDownloading,
    List<Movie> movies,
    MovieDetailState movieDetailState,
    List<Cast> castOfSpecifiedMovie,
  }) {
    return AppState(
      initialDataDownloading:
          initialDataDownloading ?? this.initialDataDownloading,
      imagesConfig: imagesConfig ?? this.imagesConfig,
      moviesDownloading: moviesDownloading ?? this.moviesDownloading,
      homeMovies: movies ?? this.homeMovies,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      castsOfSpecifiedMovie: castOfSpecifiedMovie ?? this.castsOfSpecifiedMovie,
    );
  }

  factory AppState.loading() => AppState(initialDataDownloading: true);
}
