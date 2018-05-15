// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cast.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => new Cast()
  ..id = json['id'] as int
  ..castId = json['cast_id'] as int
  ..creditId = json['credit_id'] as String
  ..gender = json['gender'] as int
  ..character = json['character'] as String
  ..name = json['name'] as String
  ..order = json['order'] as int
  ..profilePath = json['profile_path'] as String;

abstract class _$CastSerializerMixin {
  int get id;
  int get castId;
  String get creditId;
  int get gender;
  String get character;
  String get name;
  int get order;
  String get profilePath;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'cast_id': castId,
        'credit_id': creditId,
        'gender': gender,
        'character': character,
        'name': name,
        'order': order,
        'profile_path': profilePath
      };
}
