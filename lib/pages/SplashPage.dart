import 'package:flutter/material.dart';
import 'package:the_movie_db/redux/containers/splash_page_body_container.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPageBodyContainer(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
