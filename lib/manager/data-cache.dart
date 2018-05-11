import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';

const String PREF_KEY_IMAGES_CONFIG = 'pref-key-images-config';

saveImagesConfig(ImagesConfig imgConfig) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(PREF_KEY_IMAGES_CONFIG, json.encode(imgConfig));
}

Future<ImagesConfig> getImagesConfig() async {
  final prefs = await SharedPreferences.getInstance();
  Map map = json.decode(prefs.getString(PREF_KEY_IMAGES_CONFIG));
  return ImagesConfig.fromJson(map);
}
