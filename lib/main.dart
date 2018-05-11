import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/SplashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheMovieDB',
      theme: ThemeData(
        primaryColor: Color(0xFF252525),
        backgroundColor: Color(0xFF303030),
        accentColor: Color(0xFFDDC40B),
      ),
      home: SplashPage(),
    );
  }
}
