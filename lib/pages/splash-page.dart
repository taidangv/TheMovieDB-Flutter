import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/home-page.dart';
import 'package:the_movie_db/manager/data-cache.dart' as dataCache;
import 'package:the_movie_db/manager/api-services.dart' as apiServices;
import 'package:the_movie_db/widgets/AppSpinner.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pageBody(context));
  }

  Widget _pageBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'The Movie DB',
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            child: AppSpinner(),
            margin: EdgeInsets.only(top: 40.0),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadImagesConfig();
  }

  Future _loadImagesConfig() async {
    String json = await apiServices.getImagesConfig();
    dataCache.saveImagesConfig(json);
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
