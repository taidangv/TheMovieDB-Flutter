import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/presentation/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/presentation/widgets/CastListViewWidget.dart';
import 'package:the_movie_db/redux/actions/movie_detail_actions.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/redux/state/selectors.dart';

class CastListingContainer extends StatelessWidget {
  CastListingContainer({@required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) => store.dispatch(LoadCastsOfMovieAction(movieId)),
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return vm.isLoading()
            ? Center(child: AppSpinnerWidget())
            : CastListViewWidget(casts: vm.casts, imgConfig: vm.imgConfig);
      },
    );
  }
}

class _ViewModel {
  final List<Cast> casts;
  final ImagesConfig imgConfig;

  _ViewModel({this.casts, this.imgConfig});

  bool isLoading() => casts == null;

  static _ViewModel fromStore(Store<AppState> store) {
    List<Cast> casts = castsOfMovieSelector(store.state);
    if (casts != null) {
      List<Cast> filteredCasts = List();
      casts.forEach((c) {
        if (c.profilePath != null && c.profilePath.isNotEmpty)
          filteredCasts.add(c);
      });
      casts = filteredCasts;
    }

    return _ViewModel(
      casts: casts,
      imgConfig: imagesConfigSelector(store.state),
    );
  }
}
