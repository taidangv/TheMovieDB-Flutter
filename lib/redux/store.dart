import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/redux/reducers/app_state_reducer.dart';
import 'package:the_movie_db/redux/middlewares/load_initial_data_middleware.dart';

Store createStore() {
  return Store<AppState>(
    appStateReducer,
    initialState: AppState.loading(),
    middleware: createInitialDataMiddleware(),
  );
}
