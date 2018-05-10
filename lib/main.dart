import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/splash-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheMovieDB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue[800],
      ),
      home: SplashPage(),
    );
  }
}
