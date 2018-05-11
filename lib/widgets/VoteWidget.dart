import 'package:flutter/material.dart';

class VoteWidget extends StatelessWidget {
  VoteWidget(this.vote);

  final double vote;

  @override
  Widget build(BuildContext context) {
    return Text(
      vote.toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
      ),
    );
  }
}
