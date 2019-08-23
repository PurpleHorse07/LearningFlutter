import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _LoginData {
  int age;
  double height;
  double weight;
}

class _CalculatorState extends State<Calculator> {
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = _LoginData();

  double _bmi = 0.0;
  String _category = "";

  void _calculateBMI() {
    setState(() {
      if (_formKey.currentState.validate()) {
        _bmi = _data.weight / (_data.height * _data.height * 0.00064516);
      }
      if (_bmi < 18.5)
        _category = "Underweight";
      else if (_bmi <= 24.9)
        _category = "Normal";
      else if (_bmi <= 29.9)
        _category = "Overweight";
      else
        _category = "Obese";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.5),
              child: Image.asset(
                "images/bmilogo.png",
                height: 200.0,
                width: 250.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey.shade300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: false,
                          ),
                          decoration: InputDecoration(
                            labelText: "Age",
                            hintText: "In Years",
                            icon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              gapPadding: 4.5,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return "Enter Your Age";
                            _data.age = int.parse(value);
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: true,
                          ),
                          decoration: InputDecoration(
                            labelText: "Height",
                            hintText: "In Feet",
                            icon: Icon(Icons.arrow_upward),
                            border: OutlineInputBorder(
                              gapPadding: 4.5,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return "Enter Your Height";
                            _data.height = double.parse(value);
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: true,
                          ),
                          decoration: InputDecoration(
                            labelText: "Weight",
                            hintText: "In Kgs",
                            icon: Icon(Icons.line_weight),
                            border: OutlineInputBorder(
                              gapPadding: 4.5,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return "Enter Your Weight";
                            _data.weight = double.parse(value);
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () => _calculateBMI(),
                          child: Text(
                            "Calculate",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.pinkAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text(
              _bmi == 0.0 ? "" : "Your BMI is: ${_bmi.toStringAsFixed(1)}",
              style: TextStyle(
                  fontSize: 22.5,
                  color: Colors.lightBlue,
                  fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              "$_category",
              style: TextStyle(
                  fontSize: 22.5,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
