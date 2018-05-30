import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';
import 'package:the_movie_db/presentation/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/data/api-services.dart' as apiServices;
import 'package:the_movie_db/data/data-cache.dart' as dataCache;
import 'package:the_movie_db/presentation/widgets/BackdropWidget.dart';
import 'package:the_movie_db/presentation/widgets/CastListingWidget.dart';
import 'package:the_movie_db/presentation/widgets/MoviePrimaryInfoWidget.dart';
import 'package:the_movie_db/presentation/widgets/PosterDescriptionWidget.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage(this._movieOverview);

  final Movie _movieOverview;

  @override
  _DetailsPageState createState() => new _DetailsPageState();
}

class _DetailsPageState extends State<MovieDetailsPage> {
  ImagesConfig _imageConfig;
  MovieDetails _details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._movieOverview.name)),
      body: _details == null ? _buildLoadingBody() : _buildContentBody(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _buildLoadingBody() {
    return Center(child: AppSpinnerWidget());
  }

  Widget _buildContentBody() {
    return ListView(
      children: <Widget>[
        BackdropWidget(widget._movieOverview, _imageConfig),
        MoviePrimaryInfoWidget(widget._movieOverview, _details),
        PosterDescriptionWidget(
            _imageConfig.buildPosterUrl(widget._movieOverview.poster),
            _details.overview),
        _castsLabel(),
        _castsListing(),
      ],
    );
  }

  Widget _castsLabel() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Text('Casts', style: TextStyle(fontSize: 18.0)),
    );
  }

  Widget _castsListing() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new Container(
        height: 220.0,
        child: CastListingWidget(widget._movieOverview.id),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getMovieDetails(widget._movieOverview.id);
  }

  _getMovieDetails(int id) async {
    MovieDetails details = await apiServices.getMovieDetails(id);
    _imageConfig = await dataCache.getImagesConfig();
    setState(() {
      _details = details;
    });
  }
}
