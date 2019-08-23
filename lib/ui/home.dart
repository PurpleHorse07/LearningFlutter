/**
 * Has implementation of following widgets
 * -> Scaffold(appBar, backgroundColor, body)
 * -> Text
 * -> AppBar(backgroundColor, title, actions)
 * -> IconButton(icon, onPressed)
 * -> Icon(Icon.any_icon)
 * -> HomeBody() >> ui/home_body.dart
 * -> BottomNavigationBar(items, elevation, selectedItemColor, unselectedItemColor, onTap, floatingActionButton,
 *                          floatingActionButtonLocation)
 * -> BottomNavigationBarItem(icon, title)
 * -> FloatingActionButton(child, elevation, backgroundColor, onPressed)
 */

import 'package:first_flutter_app/ui/home_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Text("Flutter App"),
        actions: <Widget>[
          IconButton(
              icon: new Icon(Icons.add_a_photo),
              onPressed: () => print("Photo Button Pressed")),
          IconButton(icon: Icon(Icons.search), onPressed: _search),
        ],
      ),
      backgroundColor: Colors.redAccent.shade50,
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Add"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backspace),
            title: Text("Subtract"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.close),
            title: Text("Multiply"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Home"),
          ),
        ],
        elevation: 8,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey.shade700,
        onTap: (int index) => print("Tapped on item $index."),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shuffle),
        elevation: 8,
        backgroundColor: Colors.greenAccent,
        onPressed: () => print("FAB Pressed"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _search() {
    print("Search Button Pressed");
  }
}
