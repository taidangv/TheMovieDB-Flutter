import 'package:json_annotation/json_annotation.dart';

part 'ImagesConfig.g.dart';

@JsonSerializable()
class ImagesConfig extends Object with _$ImagesConfigSerializerMixin {
  ImagesConfig(this.baseUrl, this.secureBaseUrl, this.backdropSizes,
      this.logoSizes, this.posterSizes, this.profileSizes, this.stillSizes);

  @JsonKey(name: 'base_url')
  String baseUrl;
  @JsonKey(name: 'secure_base_url')
  String secureBaseUrl;
  @JsonKey(name: 'backdrop_sizes')
  List<String> backdropSizes;
  @JsonKey(name: 'logo_sizes')
  List<String> logoSizes;
  @JsonKey(name: 'poster_sizes')
  List<String> posterSizes;
  @JsonKey(name: 'profile_sizes')
  List<String> profileSizes;

  @JsonKey(name: 'still_sizes')
  List<String> stillSizes;

  factory ImagesConfig.fromJson(Map<String, dynamic> json) =>
      _$ImagesConfigFromJson(json);

  String buildPosterUrl(String posterPath) => baseUrl + 'w342' + posterPath;
  String buildBackdropUrl(String backdropPath) => baseUrl + 'w780' + backdropPath;

}
