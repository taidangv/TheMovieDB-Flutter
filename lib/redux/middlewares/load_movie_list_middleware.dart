import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/actions/home_movies_actions.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/data/api-services.dart' as apiService;

List<Middleware<AppState>> createLoadMovieListMiddleware() {
  return [
    TypedMiddleware<AppState, LoadMovieListAction>(_loadMovieList()),
  ];
}

Middleware<AppState> _loadMovieList() {
  return (Store<AppState> store, action, NextDispatcher next) {
    apiService.getMovies().then((movies) {
      store.dispatch(MovieListLoadedAction(movies));
    }).catchError((error) {
      store.dispatch(MovieListNotLoadedAction(error));
    });
  };
}
