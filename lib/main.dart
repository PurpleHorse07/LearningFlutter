import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

void main() async {
  Map _data = await _getData();

  runApp(MaterialApp(
    title: "Quakes",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Quake"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          itemCount: _data["metadata"]["count"],
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 3.5,
                  indent: 10,
                  endIndent: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      convertToTime(
                          "${_data["features"][position]["properties"]["time"]}"),
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "${_data["features"][position]["properties"]["place"]}"),
                    leading: CircleAvatar(
                      radius: 38.5,
                      backgroundColor:
                          position % 2 == 0 ? Colors.green : Colors.lightBlue,
                      child: Text(
                        "${_data["features"][position]["properties"]["mag"]}",
                        style: TextStyle(color: Colors.white, fontSize: 19.5),
                      ),
                    ),
                    onTap: () => showTappedMessage(context,
                        "${_data["features"][position]["properties"]["title"]}"),
                  ),
                )
              ],
            );
          }),
    ),
  ));
}

String convertToTime(String time) {
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(int.parse(time));
  var format = new DateFormat("MMMM dd, yyyy hh:mm a");
  return format.format(date);
}

showTappedMessage(BuildContext context, String message) {
  var alert = AlertDialog(
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text("OK"),
      ),
    ],
    elevation: 8.0,
    title: Text("Quakes"),
    content: Text(message),
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<Map> _getData() async {
  Response response = await get(
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson");
  return json.decode(response.body);
}
