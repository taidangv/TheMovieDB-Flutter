import 'package:flutter/material.dart';

class LabelIconWidget extends StatelessWidget {
  LabelIconWidget(this._iconData, this._label);

  final IconData _iconData;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(_iconData, color: Theme.of(context).accentColor),
        new Container(
          margin: EdgeInsets.only(left: 4.0),
          child: Text(
            _label,
            style: TextStyle(color: Colors.grey[400]),
          ),
        ),
      ],
    );
  }
}
