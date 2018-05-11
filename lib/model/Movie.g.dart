// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => new Movie()
  ..id = json['id'] as int
  ..name = json['title'] as String
  ..brief = json['overview'] as String
  ..poster = json['poster_path'] as String
  ..backdrop = json['backdrop_path'] as String
  ..vote = (json['vote_average'] as num)?.toDouble()
  ..releaseDate = json['release_date'] as String
  ..genreIds = (json['genre_ids'] as List)?.map((e) => e as int)?.toList();

abstract class _$MovieSerializerMixin {
  int get id;
  String get name;
  String get brief;
  String get poster;
  String get backdrop;
  double get vote;
  String get releaseDate;
  List<int> get genreIds;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': name,
        'overview': brief,
        'poster_path': poster,
        'backdrop_path': backdrop,
        'vote_average': vote,
        'release_date': releaseDate,
        'genre_ids': genreIds
      };
}
