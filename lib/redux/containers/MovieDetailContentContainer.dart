import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';
import 'package:the_movie_db/presentation/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/presentation/widgets/BackdropWidget.dart';
import 'package:the_movie_db/presentation/widgets/CastListingWidget.dart';
import 'package:the_movie_db/presentation/widgets/MoviePrimaryInfoWidget.dart';
import 'package:the_movie_db/presentation/widgets/PosterDescriptionWidget.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MovieDetailContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: _scaffold,
    );
  }

  Widget _scaffold(BuildContext context, _ViewModel vm) {
    return Scaffold(
      appBar: AppBar(title: Text(vm.overview.name)),
      body: vm.isLoading() ? _buildLoadingBody() : _buildContentBody(vm),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _buildLoadingBody() => Center(child: AppSpinnerWidget());

  Widget _buildContentBody(_ViewModel vm) {
    return ListView(
      children: <Widget>[
        BackdropWidget(vm.overview, vm.imagesConfig),
        MoviePrimaryInfoWidget(vm.overview, vm.details),
        PosterDescriptionWidget(
            vm.imagesConfig.buildPosterUrl(vm.overview.poster),
            vm.details.overview),
        _castsLabel(),
        _castsListing(vm),
      ],
    );
  }

  Widget _castsLabel() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Text('Casts', style: TextStyle(fontSize: 18.0)),
    );
  }

  Widget _castsListing(_ViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new Container(
        height: 220.0,
        child: CastListingWidget(vm.overview.id),
      ),
    );
  }

// end MovieDetailContentContainer
}

class _ViewModel {
  final Movie overview;
  final MovieDetails details;
  final ImagesConfig imagesConfig;

  _ViewModel({
    this.overview,
    this.details,
    this.imagesConfig,
  });

  bool isLoading() => details == null;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      overview: store.state.movieDetailState.overview,
      details: store.state.movieDetailState.details,
      imagesConfig: store.state.imagesConfig,
    );
  }
}
