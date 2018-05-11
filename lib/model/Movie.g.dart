// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => new Movie(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['release_date'] as String);

abstract class _$MovieSerializerMixin {
  int get id;
  String get name;
  String get brief;
  String get poster;
  String get backdrop;
  double get vote;
  String get releaseDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': name,
        'overview': brief,
        'poster_path': poster,
        'backdrop_path': backdrop,
        'vote_average': vote,
        'release_date': releaseDate
      };
}
