// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieDetails.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) =>
    new MovieDetails()
      ..homepage = json['homepage'] as String
      ..overview = json['overview'] as String
      ..runtime = json['runtime'] as int
      ..status = json['status'] as String
      ..tagline = json['tagline'] as String
      ..imdbId = json['imdb_id'] as String
      ..popularity = (json['popularity'] as num)?.toDouble();

abstract class _$MovieDetailsSerializerMixin {
  String get homepage;
  String get overview;
  int get runtime;
  String get status;
  String get tagline;
  String get imdbId;
  double get popularity;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'homepage': homepage,
        'overview': overview,
        'runtime': runtime,
        'status': status,
        'tagline': tagline,
        'imdb_id': imdbId,
        'popularity': popularity
      };
}
