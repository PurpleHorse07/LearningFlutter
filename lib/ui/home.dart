import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  int _radioValue = 0;
  String _resultText = "";

  void _radioValueChanged(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _resultText =
              "Your weight on Pluto is ${_calculateWeight(_controller.text, 0.06).toStringAsFixed(2)} Kgs!";
          break;
        case 1:
          _resultText =
              "Your weight on Jupiter is ${_calculateWeight(_controller.text, 2.34).toStringAsFixed(2)} Kgs!";
          break;
        case 2:
          _resultText =
              "Your weight on Mars is ${_calculateWeight(_controller.text, 0.38).toStringAsFixed(2)} Kgs!";
          break;
      }
    });
    print(_radioValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weight On Planet X",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
          alignment: Alignment.topCenter,
          color: Colors.grey.shade300,
          child: ListView(
            padding: EdgeInsets.all(5.5),
            children: <Widget>[
              Image.asset(
                "images/planet.png",
                width: 200.0,
                height: 200.0,
              ),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                decoration: InputDecoration(
                  labelText: "Enter Your Weight On Earth",
                  hintText: "In Kgs",
                  icon: Icon(Icons.person),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _radioValueChanged,
                    activeColor: Colors.brown.shade800,
                  ),
                  Text(
                    "Pluto",
                  ),
                  Radio<int>(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _radioValueChanged,
                    activeColor: Colors.deepOrangeAccent,
                  ),
                  Text(
                    "Jupiter",
                  ),
                  Radio<int>(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: _radioValueChanged,
                    activeColor: Colors.redAccent,
                  ),
                  Text(
                    "Mars",
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16.5),
              ),
              Text(
                _controller.text.isEmpty
                    ? "Please Enter Weight"
                    : "$_resultText",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }

  double _calculateWeight(String weight, double gravity) {
    try {
      if (weight != null &&
          weight.trim().isNotEmpty &&
          double.parse(weight) > 0.0) return double.parse(weight) * gravity;
    } catch (error) {
      print(error.toString());
    }
    return 0;
  }
}
