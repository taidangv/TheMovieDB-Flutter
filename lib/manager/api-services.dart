import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_movie_db/keys.dart';
import 'package:the_movie_db/model/Movie.dart';

const String _API_PATH_CONFIG = "configuration";
const String _API_PATH_MOVIES = "movie/now_playing";

String _buildApiUrl(String path) {
  return "https://api.themoviedb.org/3/$path?api_key=$API_KEY";
}

Future<String> getImagesConfig() async {
  http.Response response = await http.get(_buildApiUrl(_API_PATH_CONFIG));
  return json.decode(response.body).toString();
}

Future<List<Movie>> getMovies() async {
  http.Response response = await http.get(_buildApiUrl(_API_PATH_MOVIES));
  List<dynamic> rawResults = json.decode(response.body)['results'];
  List<Movie> movies = List();
  rawResults.forEach((rawItem) {
    Movie m = Movie();
    m.id = rawItem['id'];
    m.name = rawItem['title'];
    m.brief = rawItem['overview'];
    m.poster = rawItem['poster_path'];
    m.backdrop = rawItem['backdrop_path'];
    movies.add(m);
  });
  return movies;
}
