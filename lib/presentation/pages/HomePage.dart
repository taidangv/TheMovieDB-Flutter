import 'package:flutter/material.dart';
import 'package:the_movie_db/redux/containers/home_content_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In Theatres")),
      body: HomeContentContainer(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
