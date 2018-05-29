import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/redux/reducers/splash_loading_reducer.dart';
import 'package:the_movie_db/redux/reducers/images_config_reducer.dart';

AppState appStateReducer(AppState prev, dynamic action) {
  return AppState(
    splashLoading: splashLoadingReducer(prev.splashLoading, action),
    imagesConfig: imagesConfigReducer(prev.imagesConfig, action),
  );
}
