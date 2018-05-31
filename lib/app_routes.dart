import 'package:flutter/material.dart';
import 'package:the_movie_db/presentation/pages/MovieDetailsPage.dart';
import 'package:the_movie_db/redux/containers/app_loading_container.dart';

class AppRoutes {
  static final home = "/"; // default route
  static final movieDetail = "/movieDetail";

  static Map<String, WidgetBuilder> create() {
    return {
      AppRoutes.home: (context) => AppLoadingContainer(),
      AppRoutes.movieDetail: (context) => MovieDetailsPage(),
    };
  }
}
