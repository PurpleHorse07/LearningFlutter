/**
 * Has implementation of following widgets
 * -> Stack(alignment, fit, children)
 * -> Text
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Stacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        Text("Hello!"),
        Text("Hi there!"),
        Text("Holla"),
      ],
    );
  }
}
