import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/model/Movie.dart';
import 'package:the_movie_db/model/MovieDetails.dart';
import 'package:the_movie_db/widgets/LabelIconWidget.dart';

class MoviePrimaryInfoWidget extends StatelessWidget {
  MoviePrimaryInfoWidget(this.overview, this.details);

  final Movie overview;
  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _title(),
          _tagline(),
          _showtime(context),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      overview.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Widget _tagline() {
    return Text(
      details.tagline,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _showtime(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          LabelIconWidget(Icons.timelapse, details.getDisplayDuration()),
          LabelIconWidget(Icons.grade, overview.vote.toString()),
          LabelIconWidget(Icons.today, _getFormattedReleaseDate()),
        ],
      ),
    );
  }

  String _getFormattedReleaseDate() {
    var date = DateTime.parse(overview.releaseDate);
    return DateFormat("MMM dd").format(date);
  }
}
