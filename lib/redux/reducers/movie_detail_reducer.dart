import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/actions/movie_detail_actions.dart';
import 'package:the_movie_db/redux/state/movie_detail_state.dart';

final movieDetailStateReducer = combineReducers<MovieDetailState>([
  TypedReducer<MovieDetailState, LoadMovieDetailAction>(_initMovieDetailState),
  TypedReducer<MovieDetailState, MovieDetailLoadedAction>(_setMovieDetail),
  TypedReducer<MovieDetailState, MovieDetailNotLoadedAction>(_setNoMovieDetail),
]);

MovieDetailState _initMovieDetailState(
    MovieDetailState prev, LoadMovieDetailAction action) {
  return MovieDetailState.initWithOverview(action.overview);
}

MovieDetailState _setMovieDetail(
    MovieDetailState prev, MovieDetailLoadedAction action) {
  return prev.copyWith(details: action.movieDetails);
}

MovieDetailState _setNoMovieDetail(
    MovieDetailState prev, MovieDetailNotLoadedAction action) {
  return prev.copyWith(details: null);
}
