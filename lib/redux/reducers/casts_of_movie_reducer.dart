import 'package:redux/redux.dart';
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/redux/actions/movie_detail_actions.dart';

final castsOfMovieReducer = combineReducers<List<Cast>>([
  TypedReducer<List<Cast>, LoadCastsOfMovieAction>(_clearCasts),
  TypedReducer<List<Cast>, CastsLoadedAction>(_setCasts),
  TypedReducer<List<Cast>, CastsNotLoadedAction>(_setNoCasts),
]);

List<Cast> _clearCasts(List<Cast> prev, LoadCastsOfMovieAction action) => null;

List<Cast> _setCasts(List<Cast> prev, CastsLoadedAction action) => action.casts;

List<Cast> _setNoCasts(List<Cast> prev, CastsNotLoadedAction action) => [];
