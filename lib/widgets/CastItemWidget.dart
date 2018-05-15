import 'package:flutter/material.dart';
import 'package:the_movie_db/model/Cast.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';

class CastItemWidget extends StatelessWidget {
  CastItemWidget(this._cast, this.imgConfig) : super(key: ObjectKey(_cast.id));

  final Cast _cast;
  final ImagesConfig imgConfig;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _profilePic(),
        _name(),
        _character(),
      ],
    );
  }

  Widget _profilePic() {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      width: 100.0,
      height: 125.0,
      child: Image.network(
        imgConfig.buildProfilePicUrl(_cast.profilePath),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _name() {
    return Text(
      _cast.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11.0,
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
