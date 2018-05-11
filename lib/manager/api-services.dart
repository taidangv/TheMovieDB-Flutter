import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_movie_db/keys.dart';
import 'package:the_movie_db/manager/parser.dart' as parser;
import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';

const String _API_PATH_CONFIG = 'configuration';
const String _API_PATH_GENRES = 'genre/movie/list';
const String _API_PATH_MOVIES = 'movie/now_playing';

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
  List<dynamic> rawResults = json.decode(response.body)['results'];
  return parser.parseMovies(rawResults);
}
