import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Genre.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/pages/HomePage.dart';
import 'package:the_movie_db/manager/data-cache.dart' as dataCache;
import 'package:the_movie_db/manager/api-services.dart' as apiServices;
import 'package:the_movie_db/widgets/AppSpinnerWidget.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageBody(context),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _pageBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'TMDB',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          Container(
            child: AppSpinnerWidget(),
            margin: EdgeInsets.only(top: 40.0),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future _loadConfig() async {
    ImagesConfig imgConfig = await apiServices.getImagesConfig();
    List<Genre> genres = await apiServices.getGenres();
    dataCache.saveImagesConfig(imgConfig);
    dataCache.saveGenres(genres);

    print(imageCache.toString());
    print(genres.toString());

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
