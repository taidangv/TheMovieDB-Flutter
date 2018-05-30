import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/actions/home_movies_actions.dart';
import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/data/api-services.dart' as apiService;

List<Middleware<AppState>> createLoadMovieListMiddleware() {
  final loadMovieList = _createLoadMovieList();

  return [
    TypedMiddleware<AppState, LoadMovieListAction>(loadMovieList),
  ];
}

Middleware<AppState> _createLoadMovieList() {
  return (Store<AppState> store, action, NextDispatcher next) {
    apiService.getMovies().then((movies) {
      store.dispatch(MovieListLoadedAction(movies));
    }).catchError((error) {
      store.dispatch(MovieListNotLoadedAction(error));
    });
  };
}
