import 'package:redux/redux.dart';
import 'package:the_movie_db/redux/actions/initial_data_actions.dart';

final initialLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, ImagesConfigLoadedAction>(_setLoaded),
  TypedReducer<bool, ImagesConfigNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool prev, dynamic action) {
  return false;
}
