import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VoteWidget extends StatelessWidget {
  VoteWidget(this.vote, this.releaseDate);

  final double vote;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildVote(),
        _buildReleaseDate(),
      ],
    );
  }

  Widget _buildVote() {
    return Container(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.star, color: _getVoteColor()),
          Text(
            vote.toString(),
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 7.0, right: 7.0),
      margin: EdgeInsets.only(top: 5.0, right: 5.0),
      decoration: BoxDecoration(
        color: Color(0x88000000),
        borderRadius: BorderRadius.all(new Radius.circular(30.0)),
      ),
    );
  }

  Widget _buildReleaseDate() {
    return Text(
      _getFormattedDate(),
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w100,
      ),
    );
  }

  Color _getVoteColor() {
    return Color.lerp(Colors.red[900], Colors.yellowAccent, (vote - 5) / 5);
  }

  String _getFormattedDate() {
    var date = DateTime.parse(releaseDate);
    return DateFormat("MMM dd").format(date);
  }
}
