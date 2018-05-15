import 'package:flutter/material.dart';
import 'package:the_movie_db/manager/api-services.dart' as apiServices;
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';
import 'package:the_movie_db/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/widgets/CastItemWidget.dart';
import 'package:the_movie_db/manager/data-cache.dart' as dataCache;

class CastListingWidget extends StatefulWidget {
  CastListingWidget(this._movieId);

  final int _movieId;

  @override
  _CastListingWidgetState createState() => new _CastListingWidgetState();
}

class _CastListingWidgetState extends State<CastListingWidget> {
  List<Cast> _casts;
  ImagesConfig _imgConfig;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: (_casts == null) ? _spinner() : _listingWidget(),
    );
  }

  Widget _spinner() {
    return Center(child: AppSpinnerWidget());
  }

  Widget _listingWidget() {
    //return CastItemWidget(_casts[0], _imgConfig);
    return new Container(
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _casts.length,
        itemBuilder: (context, index) =>
            CastItemWidget(_casts[index], _imgConfig),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getCasts();
  }

  _getCasts() async {
    List<Cast> casts = await apiServices.getCast(widget._movieId);
    List<Cast> filteredCasts = List();
    casts.forEach((c) {
      if (c.profilePath != null && c.profilePath.isNotEmpty)
        filteredCasts.add(c);
    });
    _imgConfig = await dataCache.getImagesConfig();
    setState(() {
      _casts = filteredCasts;
    });
  }
}
