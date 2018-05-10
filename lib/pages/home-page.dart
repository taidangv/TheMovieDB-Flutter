import 'package:flutter/material.dart';
import 'package:the_movie_db/manager/data-cache.dart' as cache;
import 'package:the_movie_db/manager/api-services.dart' as repo;
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/widgets/AppSpinner.dart';
import 'package:the_movie_db/widgets/MovieItem.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _imagesConfig;
  List<Movie> _movies;

  @override
  void initState() {
    super.initState();
    _getImagesConfig();
    _getMovies();
  }

  _getImagesConfig() async {
    String json = await cache.getImagesConfig();
    _imagesConfig = json;
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
      appBar: AppBar(title: Text("Home Page")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_movies == null || _movies.isEmpty) {
      return Center(child: AppSpinner());
    } else {
      return _buildListView();
    }
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, idx) {
          return _buildRow(_movies[idx]);
        });
  }

  Widget _buildRow(Movie m) {
    return MovieItem(key: ObjectKey(m.id), movie: m);
  }
}
