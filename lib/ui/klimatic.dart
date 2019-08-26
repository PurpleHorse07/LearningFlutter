import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:klimatic/util/utils.dart' as util;

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  void getData() async {
    Map data = await getWeather(util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Klimatic",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: 0.9,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => getData(),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/umbrella.png",
              fit: BoxFit.fitHeight,
              height: 1200,
            ),
          ),
          Container(
            child: Text(
              "Hello",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 22.5),
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 10, 20, 5),
          ),
          Container(
            child: Image.asset("images/light_rain.png"),
            alignment: Alignment.center,
          ),
          Container(
            child: updateTemp(util.defaultCity),
            margin: EdgeInsets.fromLTRB(100, 500, 0, 10),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }

  Future<Map> getWeather(String city) async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}&units=metric";

    Response response = await get(url);

    return json.decode(response.body);
  }

  Widget updateTemp(String city) {
    return new FutureBuilder(
        future: getWeather(city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              child: Column(
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      content['main']['temp'].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        });
  }
}
