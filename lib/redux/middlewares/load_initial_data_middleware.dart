import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/data/api-services.dart' as apiService;
import 'package:the_movie_db/redux/actions/initial_data_actions.dart';

List<Middleware<AppState>> createInitialDataMiddleware() {
  return [
    TypedMiddleware<AppState, LoadImagesConfigAction>(_loadImagesConfig()),
  ];
}

Middleware<AppState> _loadImagesConfig() {
  return (Store<AppState> store, action, NextDispatcher next) {
    apiService
        .getImagesConfig()
        .then((imagesConfig) =>
            store.dispatch(ImagesConfigLoadedAction(imagesConfig)))
        .catchError(
            (error) => store.dispatch(ImagesConfigNotLoadedAction(error)));
  };
}
