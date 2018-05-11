import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/Movie.dart';

List<Movie> parseMovies(List<dynamic> raw) {
  List<Movie> movies = List();
  raw.forEach((rawItem) {
    Movie m = Movie.fromJson(rawItem);
    movies.add(m);
  });
  return movies;
}

List<Genre> parseGenres(List<dynamic> raw) {
  List<Genre> genres = List();
  raw.forEach((rawItem) {
    genres.add(Genre.fromJson(rawItem));
  });
  return genres;
}