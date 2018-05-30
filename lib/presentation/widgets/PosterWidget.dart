import 'package:flutter/material.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/model/Movie.dart';

class PosterWidget extends StatelessWidget {
  PosterWidget(this._posterUrl);

  final String _posterUrl;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Image.network(
        _posterUrl,
        fit: BoxFit.cover,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]),
      ),
    );
  }
}
