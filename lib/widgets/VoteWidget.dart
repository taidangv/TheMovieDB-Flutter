import 'package:flutter/material.dart';

class VoteWidget extends StatelessWidget {
  VoteWidget(this.vote);

  final double vote;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Color(0x88000000),
        borderRadius: BorderRadius.all(new Radius.circular(30.0)),
      ),
      padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 7.0, right: 7.0),
      margin: EdgeInsets.all(5.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.star, color: _getVoteColor()),
          Text(
            vote.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }

  Color _getVoteColor() {
    return Color.lerp(Colors.red[900], Colors.yellowAccent, (vote - 5) / 5);
  }
}
