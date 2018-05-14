import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/SplashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheMovieDB',
      theme: ThemeData(
        primaryColor: Color(0xFF0D1C34),
        backgroundColor: Color(0xFF161D29),
        accentColor: Color(0xFFF9473A),
      ),
      home: SplashPage(),
    );
  }
}
