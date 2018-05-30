import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';

const String PREF_KEY_IMAGES_CONFIG = 'pref-key-images-config';
const String PREF_KEY_GENRES = 'pref-key-genres';

//saveImagesConfig(ImagesConfig imgConfig) async {
//  final prefs = await SharedPreferences.getInstance();
//  prefs.setString(PREF_KEY_IMAGES_CONFIG, json.encode(imgConfig));
//}

Future<ImagesConfig> getImagesConfig() async {
  final prefs = await SharedPreferences.getInstance();
  Map map = json.decode(prefs.getString(PREF_KEY_IMAGES_CONFIG));
  return ImagesConfig.fromJson(map);
}

//saveGenres(List<Genre> genres) async {
//  final prefs = await SharedPreferences.getInstance();
//  prefs.setString(PREF_KEY_GENRES, json.encode(genres));
//}

//Future<List<Genre>> getGenres() async {
//  final prefs = await SharedPreferences.getInstance();
//  List<dynamic> listObj = json.decode(prefs.getString(PREF_KEY_GENRES));
//  List<Genre> genres = List();
//  listObj.forEach((e) {
//    genres.add(Genre.fromJson(e));
//  });
//  return genres;
//}
