import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;

  const ShadowText(
    this.data, {
    Key key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
  }) : assert(data != null);

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 1.0,
            left: 1.0,
            child: new Text(
              data,
              style: style.copyWith(color: Colors.black.withOpacity(0.5)),
              textAlign: textAlign,
              textDirection: textDirection,
              softWrap: softWrap,
              overflow: overflow,
              textScaleFactor: textScaleFactor,
              maxLines: maxLines,
            ),
          ),
          new Text(
            data,
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
