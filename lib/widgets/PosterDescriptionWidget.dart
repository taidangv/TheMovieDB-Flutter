import 'package:flutter/material.dart';
import 'package:the_movie_db/widgets/PosterWidget.dart';

class PosterDescriptionWidget extends StatelessWidget {
  PosterDescriptionWidget(this._posterUrl, this._description);

  final String _posterUrl;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _posterWidget(),
          _descriptionWidget(),
        ],
      ),
    );
  }

  Widget _posterWidget() {
    return new Expanded(
      child: PosterWidget(_posterUrl),
      flex: 2,
    );
  }

  Widget _descriptionWidget() {
    return new Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          _description,
          maxLines: 9,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      flex: 5,
    );
  }
}
