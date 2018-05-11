import 'package:json_annotation/json_annotation.dart';

part 'Genre.g.dart';

@JsonSerializable()
class Genre extends Object with _$GenreSerializerMixin {
  Genre(this.id, this.name);

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
