import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/app_routes.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/presentation/pages/MovieDetailsPage.dart';
import 'package:the_movie_db/presentation/widgets/MovieItemWidget.dart';
import 'package:the_movie_db/redux/actions/movie_detail_actions.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MovieItemContainer extends StatelessWidget {
  final Movie movie;

  MovieItemContainer({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return GestureDetector(
          onTap: () => vm.onItemClicked(context, movie),
          child: MovieItemWidget(
              key: ObjectKey(movie.id),
              movie: movie,
              imgConfig: vm.imagesConfig),
        );
      },
    );
  }
}

class _ViewModel {
  final ImagesConfig imagesConfig;
  final Function(BuildContext context, Movie m) onItemClicked;

  _ViewModel({
    this.imagesConfig,
    this.onItemClicked,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      imagesConfig: store.state.imagesConfig,
      onItemClicked: (context, movie) {
        store.dispatch(LoadMovieDetailAction(movie));
        Navigator.pushNamed(context, AppRoutes.movieDetail);
      },
    );
  }
}
