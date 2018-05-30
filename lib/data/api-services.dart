import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_movie_db/keys.dart';
import 'package:the_movie_db/data/parser.dart' as parser;
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';
import 'data-cache.dart' as dataCache;

const String _API_PATH_CONFIG = 'configuration';
const String _API_PATH_GENRES = 'genre/movie/list';
const String _API_PATH_MOVIES = 'movie/now_playing';
const String _API_PATH_MOVIE_DETAILS = 'movie/';
const String _API_PATH_CREDITS = 'movie/:movieId/credits';

String _buildApiUrl(String path) {
  return "https://api.themoviedb.org/3/$path?api_key=$API_KEY";
}

Future<ImagesConfig> getImagesConfig() async {
  http.Response response = await http.get(_buildApiUrl(_API_PATH_CONFIG));
  dynamic rawResult = json.decode(response.body)['images'];
  return ImagesConfig.fromJson(rawResult);
}

Future<List<Genre>> getGenres() async {
  http.Response res = await http.get(_buildApiUrl(_API_PATH_GENRES));
  dynamic rawResult = json.decode(res.body)['genres'];
  return parser.parseGenres(rawResult);
}

Future<List<Movie>> getMovies() async {
  http.Response response = await http.get(_buildApiUrl(_API_PATH_MOVIES));
  List<Genre> genres = await dataCache.getGenres();
  List<dynamic> rawResults = json.decode(response.body)['results'];
  return parser.parseMovies(rawResults, genres);
}

Future<MovieDetails> getMovieDetails(int id) async {
  String url = _buildApiUrl(_API_PATH_MOVIE_DETAILS + id.toString());
  http.Response res = await http.get(url);
  return MovieDetails.fromJson(json.decode(res.body));
}

Future<List<Cast>> getCast(int movieId) async {
  String finalPath =
      _API_PATH_CREDITS.replaceAll(':movieId', movieId.toString());
  print(_buildApiUrl(finalPath).toString());
  http.Response res = await http.get(_buildApiUrl(finalPath));
  dynamic jsonArr = json.decode(res.body)['cast'];
  return parser.parseCasts(jsonArr);
}
