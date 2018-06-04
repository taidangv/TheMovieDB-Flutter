import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/presentation/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/presentation/widgets/MovieListingWidget.dart';
import 'package:the_movie_db/redux/actions/home_movies_actions.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_movie_db/redux/state/selectors.dart';

class HomeContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) => store.dispatch(LoadMovieListAction()),
      converter: _ViewModel.fromModel,
      builder: (context, vm) {
        if (vm.isLoading()) {
          return Center(child: AppSpinnerWidget());
        } else {
          return MovieListingWidget(vm.movies, vm.imagesConfig);
        }
      },
    );
  }
}

class _ViewModel {
  final bool moviesDownloading;
  final List<Movie> movies;
  final ImagesConfig imagesConfig;

  _ViewModel({
    this.moviesDownloading,
    this.movies,
    this.imagesConfig,
  });

  bool isLoading() => moviesDownloading || movies == null;

  static _ViewModel fromModel(Store<AppState> store) {
    return _ViewModel(
      moviesDownloading: moviesDownloadingSelector(store.state),
      movies: homeMoviesSelector(store.state),
      imagesConfig: imagesConfigSelector(store.state),
    );
  }
}
