import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/actions/movie_detail_actions.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/data/api-services.dart' as apiService;

List<Middleware<AppState>> createLoadMovieDetailMiddleware() {
  return [
    TypedMiddleware<AppState, LoadMovieDetailAction>(_loadMovieDetail()),
  ];
}

Middleware<AppState> _loadMovieDetail() {
  return (Store<AppState> store, action, NextDispatcher next) {
    apiService
        .getMovieDetails((action as LoadMovieDetailAction).overview.id)
        .then((movieDetails) =>
            store.dispatch(MovieDetailLoadedAction(movieDetails)))
        .catchError(
            (error) => store.dispatch(MovieDetailNotLoadedAction(error)));

    next(action);
  };
}
