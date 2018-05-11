import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_db/model/Genre.dart';

part 'Movie.g.dart';

@JsonSerializable()
class Movie extends Object with _$MovieSerializerMixin {
  Movie();

  int id;
  @JsonKey(name: 'title')
  String name;
  @JsonKey(name: 'overview')
  String brief;
  @JsonKey(name: 'poster_path')
  String poster;
  @JsonKey(name: 'backdrop_path')
  String backdrop;
  @JsonKey(name: 'vote_average')
  double vote;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;

  @JsonKey(ignore: true)
  List<Genre> genres;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
