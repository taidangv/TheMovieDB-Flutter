import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/redux/actions/movie_detail_actions.dart';
import 'package:the_movie_db/data/api-services.dart' as apiService;

List<Middleware<AppState>> createLoadCastsOfMovieMiddleware() {
  final loadCasts = _createLoadCasts();

  return [
    TypedMiddleware<AppState, LoadCastsOfMovieAction>(loadCasts),
  ];
}

Middleware<AppState> _createLoadCasts() {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(CleanUpCastsOfMovieAction());
    apiService
        .getCast((action as LoadCastsOfMovieAction).movieId)
        .then((casts) => store.dispatch(CastsLoadedAction(casts)))
        .catchError((error) => store.dispatch(CastsNotLoadedAction(error)));
  };
}
