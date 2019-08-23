import 'package:first_flutter_app/ui/gesture.dart';
/**
 * Has implementation of following widgets
 * -> MaterialApp(home)
 * -> Home() >> ui/home.dart
 * -> Gestures() >> ui/gesture.dart
 */

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Gestures(
      title: "Gesture Detector",
    ),
//    home: Home(),
  ));
}
