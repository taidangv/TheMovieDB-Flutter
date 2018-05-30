import 'package:redux/redux.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/redux/actions/home_movies_actions.dart';

final movieListReducer = combineReducers<List<Movie>>([
  TypedReducer<List<Movie>, MovieListLoadedAction>(_setMovieList),
  TypedReducer<List<Movie>, MovieListNotLoadedAction>(_setNoMovieList),
]);

List<Movie> _setMovieList(List<Movie> prev, MovieListLoadedAction action) =>
    action.movies;

List<Movie> _setNoMovieList(
        List<Movie> prev, MovieListNotLoadedAction action) =>
    [];
