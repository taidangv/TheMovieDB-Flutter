import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/redux/actions/initial_data_actions.dart';
import 'package:redux/redux.dart';

final imagesConfigReducer = combineReducers<ImagesConfig>([
  TypedReducer<ImagesConfig, ImagesConfigLoadedAction>(_setImagesConfig),
  TypedReducer<ImagesConfig, ImagesConfigNotLoadedAction>(_setNoImagesConfig),
]);

ImagesConfig _setImagesConfig(
    ImagesConfig prev, ImagesConfigLoadedAction action) {
  return action.imagesConfig;
}

ImagesConfig _setNoImagesConfig(
    ImagesConfig prev, ImagesConfigNotLoadedAction action) {
  return ImagesConfig();
}
