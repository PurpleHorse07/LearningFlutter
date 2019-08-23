/**
 * Has implementation of following widgets
 * -> Center(child)
 * -> Text
 * -> Columns() >> ui/columns.dart
 * -> Row(mainAxisAlignment, children)
 * -> Expanded(child)
 * -> InkWell(child, onTap, onDoubleTap)
 */

import 'package:first_flutter_app/ui/columns.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Columns(),
          Columns(),
          Columns(),
          Expanded(
            child: InkWell(
              child: Text("Constant"),
              onTap: () => print("Tapped Inkwell"),
              onDoubleTap: () => print("Double Tapped Inkwell"),
            ),
          ),
        ],
      ),
    );
  }
}
