import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/redux/state/movie_detail_state.dart';

ImagesConfig imagesConfigSelector(AppState s) => s.imagesConfig;

bool moviesDownloadingSelector(AppState s) => s.moviesDownloading;

List<Movie> homeMoviesSelector(AppState s) => s.homeMovies;

MovieDetailState movieDetailStateSelector(AppState s) => s.movieDetailState;

List<Cast> castsOfMovieSelector(AppState s) => s.castsOfSpecifiedMovie;
