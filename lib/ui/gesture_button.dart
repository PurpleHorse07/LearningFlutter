/**
 * Has implementation of following widgets
 * -> GestureDetector(onTap, child)
 * -> SnackBar(content, elevation, duration)
 * -> Duration(seconds, milliseconds)
 * -> Text
 * -> Container(padding, decoration, child)
 * -> Decoration(borderRadius, boxShadow, color)
 * -> BoxShadow(color, offset, blurRadius)
 */

import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Tapped Gesture"),
        elevation: 8,
        duration: Duration(seconds: 2, milliseconds: 500),
      )),
      child: Container(
        padding: EdgeInsets.all(18.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset.fromDirection(2),
              color: Colors.grey.shade700,
              blurRadius: 5,
            )
          ],
          color: Colors.greenAccent.shade400,
        ),
        child: Text("A Button!"),
      ),
    );
  }
}
