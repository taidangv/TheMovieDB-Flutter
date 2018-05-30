import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/redux/reducers/initial_loading_reducer.dart';
import 'package:the_movie_db/redux/reducers/images_config_reducer.dart';
import 'package:the_movie_db/redux/reducers/movie_list_loading_reducer.dart';
import 'package:the_movie_db/redux/reducers/movie_list_reducer.dart';

AppState appStateReducer(AppState prev, dynamic action) {
  return AppState(
    initialDataDownloading:
        initialLoadingReducer(prev.initialDataDownloading, action),
    imagesConfig: imagesConfigReducer(prev.imagesConfig, action),
    moviesDownloading: movieListLoadingReducer(prev.moviesDownloading, action),
    homeMovies: movieListReducer(prev.homeMovies, action),
  );
}
