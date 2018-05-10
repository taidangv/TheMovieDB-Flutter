import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const String PREF_KEY_IMAGES_CONFIG = 'pref-key-images-config';

saveImagesConfig(String json) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(PREF_KEY_IMAGES_CONFIG, json);
}

Future<String> getImagesConfig() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(PREF_KEY_IMAGES_CONFIG);
}
