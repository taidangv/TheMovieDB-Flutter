import 'package:json_annotation/json_annotation.dart';

part 'Cast.g.dart';

@JsonSerializable()
class Cast extends Object with _$CastSerializerMixin {
  Cast();

  int id;
  @JsonKey(name: 'cast_id')
  int castId;
  @JsonKey(name: 'credit_id')
  String creditId;
  int gender;
  String character;
  String name;
  int order;
  @JsonKey(name: 'profile_path')
  String profilePath;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
