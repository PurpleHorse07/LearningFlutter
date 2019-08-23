import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _amount = 0;
  var _color = Colors.greenAccent;

  void _makeItRain() {
    setState(() {
      _amount += 100;
      if (_amount >= 1000) _color = Colors.redAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Make It Rain"),
          centerTitle: true,
          textTheme: TextTheme(
            title: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 0.6,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    "Hi There!",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 28.5,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "\$$_amount",
                    style: TextStyle(
                        color: _color,
                        fontSize: 48.5,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(38.5),
                child: Center(
                  child: RaisedButton(
                    padding: EdgeInsets.all(18.5),
                    child: Text(
                      "Let It Rain",
                      style: TextStyle(
                        fontSize: 22.5,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => _makeItRain(),
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
