import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';
import 'package:the_movie_db/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/manager/api-services.dart' as apiServices;
import 'package:the_movie_db/manager/data-cache.dart' as dataCache;
import 'package:the_movie_db/widgets/BackdropWidget.dart';
import 'package:the_movie_db/widgets/VoteWidget.dart';

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
    );
  }

  Widget _buildLoadingBody() {
    return Center(child: AppSpinnerWidget());
  }

  Widget _buildContentBody() {
    return ListView(
      children: <Widget>[
        BackdropWidget(movie: widget._movieOverview, imgConfig: _imageConfig),
        Text(_details.tagline),
        Text(_details.overview),
      ],
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
