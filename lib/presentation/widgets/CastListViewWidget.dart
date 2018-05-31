import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/presentation/widgets/CastItemWidget.dart';

class CastListViewWidget extends StatelessWidget {
  final List<Cast> casts;
  final ImagesConfig imgConfig;

  CastListViewWidget({this.casts, this.imgConfig});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 7.0, right: 7.0),
        scrollDirection: Axis.horizontal,
        itemCount: casts.length,
        itemBuilder: (_, idx) => CastItemWidget(casts[idx], imgConfig),
      ),
    );
  }
}
