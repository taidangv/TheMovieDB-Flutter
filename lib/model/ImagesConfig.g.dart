// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImagesConfig.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ImagesConfig _$ImagesConfigFromJson(Map<String, dynamic> json) =>
    new ImagesConfig()
      ..baseUrl = json['base_url'] as String
      ..secureBaseUrl = json['secure_base_url'] as String
      ..backdropSizes =
          (json['backdrop_sizes'] as List)?.map((e) => e as String)?.toList()
      ..logoSizes =
          (json['logo_sizes'] as List)?.map((e) => e as String)?.toList()
      ..posterSizes =
          (json['poster_sizes'] as List)?.map((e) => e as String)?.toList()
      ..profileSizes =
          (json['profile_sizes'] as List)?.map((e) => e as String)?.toList()
      ..stillSizes =
          (json['still_sizes'] as List)?.map((e) => e as String)?.toList();

abstract class _$ImagesConfigSerializerMixin {
  String get baseUrl;
  String get secureBaseUrl;
  List<String> get backdropSizes;
  List<String> get logoSizes;
  List<String> get posterSizes;
  List<String> get profileSizes;
  List<String> get stillSizes;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_url': baseUrl,
        'secure_base_url': secureBaseUrl,
        'backdrop_sizes': backdropSizes,
        'logo_sizes': logoSizes,
        'poster_sizes': posterSizes,
        'profile_sizes': profileSizes,
        'still_sizes': stillSizes
      };
}
