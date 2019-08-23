/**
 * Has implementation of following widgets
 * -> Column(mainAxisAlignment, children)
 * -> Text(textDirection, style)
 * -> TextStyle(shadows, fontSize)
 * -> Shadow(color, offset, blurRadius)
 */

import 'dart:ui';

import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Column 1",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                  color: Colors.black,
                  offset: Offset.fromDirection(15),
                  blurRadius: 9)
            ],
            fontSize: 18,
          ),
        ),
        Text(
          "Column 2",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                  color: Colors.black,
                  offset: Offset.fromDirection(10),
                  blurRadius: 7)
            ],
            fontSize: 18,
          ),
        ),
        Text(
          "Column 3",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                  color: Colors.black,
                  offset: Offset.fromDirection(5),
                  blurRadius: 5)
            ],
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
