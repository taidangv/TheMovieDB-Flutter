// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Genre.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) =>
    new Genre(json['id'] as int, json['name'] as String);

abstract class _$GenreSerializerMixin {
  int get id;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};
}
