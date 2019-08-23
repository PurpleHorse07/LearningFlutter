/**
 * Has implementation of following widgets
 * -> Scaffold(appBar, body)
 * -> AppBar(title, backgroundColor)
 * -> Text
 * -> Center(child)
 * -> GestureButton() >> ui/gesture_button.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gesture_button.dart';

class Gestures extends StatelessWidget {
  final String title;

  Gestures({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: GestureButton(),
      ),
    );
  }
}
