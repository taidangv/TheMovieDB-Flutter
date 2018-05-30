import 'package:flutter/material.dart';
import 'package:the_movie_db/data//data-cache.dart' as cache;
import 'package:the_movie_db/data/api-services.dart' as repo;
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/presentation/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/presentation/widgets/MovieListingWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagesConfig _imagesConfig;
  List<Movie> _movies;

  @override
  void initState() {
    super.initState();
    _getImagesConfig();
    _getMovies();
  }

  _getImagesConfig() async {
    _imagesConfig = await cache.getImagesConfig();
  }

  _getMovies() async {
    List<Movie> movies = await repo.getMovies();
    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In Theatres")),
      body: _buildBody(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _buildBody() {
    if (_movies == null || _movies.isEmpty) {
      return Center(child: AppSpinnerWidget());
    } else {
      return MovieListingWidget(_movies, _imagesConfig);
    }
  }
}
