import 'package:json_annotation/json_annotation.dart';

part 'MovieDetails.g.dart';

@JsonSerializable()
class MovieDetails extends Object with _$MovieDetailsSerializerMixin {
  MovieDetails();

  String homepage;
  String overview;
  int runtime;
  String status;
  String tagline;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  double popularity;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

//  val credits: CreditsResponse,
//  val videos: ClipResponse,
//  val genres: JsonElement?,
//  val production_countries: JsonElement,
//  val release_dates: JsonElement

}
