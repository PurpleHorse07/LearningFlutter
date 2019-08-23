import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() async {
  List _data = await _apiCall();
  runApp(MaterialApp(
    title: "JSON Parsing",
    home: Scaffold(
      appBar: AppBar(
        title: Text("JSON parsing"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: _data.length,
        padding: EdgeInsets.all(8.5),
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: <Widget>[
              Divider(
                height: 3.5,
                indent: 10,
                endIndent: 2,
              ),
              ListTile(
                title: Text(_data[position]["title"]),
                subtitle: Text(_data[position]["body"]),
                leading: CircleAvatar(
                  backgroundColor:
                      position % 2 == 0 ? Colors.green : Colors.lightBlue,
                  child: Text(
                      _data[position]["title"][0].toString().toUpperCase()),
                ),
                onTap: () => showTappedMessege(context, position),
              )
            ],
          );
        },
      ),
    ),
  ));
}

void showTappedMessege(BuildContext context, int position) {
  print(position);
  var alert = AlertDialog(
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text("OK"),
      ),
    ],
    elevation: 8.0,
    title: Text("Alert Dialog"),
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<List> _apiCall() async {
  String url = "http://jsonplaceholder.typicode.com/posts";
  Response response = await get(url);
  return json.decode(response.body);
}
