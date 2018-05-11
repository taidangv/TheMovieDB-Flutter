import 'package:json_annotation/json_annotation.dart';

part 'Movie.g.dart';

@JsonSerializable()
class Movie extends Object with _$MovieSerializerMixin {
  Movie(this.id, this.name, this.brief, this.poster, this.backdrop, this.vote, this.releaseDate);

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

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
