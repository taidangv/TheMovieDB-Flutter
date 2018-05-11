import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/Movie.dart';

List<Movie> parseMovies(List<dynamic> raw, List<Genre> genres) {
  List<Movie> movies = List();
  raw.forEach((rawItem) {
    Movie m = Movie.fromJson(rawItem);
    m.genres = _getGenres(m.genreIds, genres);
    movies.add(m);
  });
  return movies;
}

List<Genre> _getGenres(List<int> genreIds, List<Genre> genres) {
  List<Genre> result = List();
  genres.forEach((g) {
    if (genreIds.contains(g.id)) {
      result.add(g);
    }
  });
  return result;
}

List<Genre> parseGenres(List<dynamic> raw) {
  List<Genre> genres = List();
  raw.forEach((rawItem) {
    genres.add(Genre.fromJson(rawItem));
  });
  return genres;
}
