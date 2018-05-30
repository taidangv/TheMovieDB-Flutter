import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/actions/home_movies_actions.dart';

final movieListLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, MovieListLoadedAction>(_setLoaded),
  TypedReducer<bool, MovieListNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool prev, dynamic action) => false;
