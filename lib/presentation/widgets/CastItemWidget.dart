import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';

class CastItemWidget extends StatelessWidget {
  CastItemWidget(this._cast, this._imgConfig) : super(key: ObjectKey(_cast.id));

  final Cast _cast;
  final ImagesConfig _imgConfig;
  final double _itemWidth = 90.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _itemWidth,
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _profilePic(),
          _name(),
          _character(),
        ],
      ),
    );
  }

  Widget _profilePic() {
    return Container(
      width: _itemWidth,
      height: 130.0,
      margin: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[700])),
      child: Image.network(
        _imgConfig.buildProfilePicUrl(_cast.profilePath),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _name() {
    return Text(
      _cast.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.0,
      ),
    );
  }

  Widget _character() {
    return Text(
      _cast.character,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11.0,
        color: Colors.grey[400],
      ),
    );
  }
}
