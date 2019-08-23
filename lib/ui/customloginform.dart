import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

class _LoginData {
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

  _LoginData _loginData = _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/face.png",
              width: 90,
              height: 90,
              color: Colors.lightBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.5),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  gapPadding: 4.5,
                  borderRadius: BorderRadius.circular(1.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return "Please Provide Your Name";
                _loginData.name = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.5),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  gapPadding: 4.5,
                  borderRadius: BorderRadius.circular(1.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return "Please Enter Password";
                _loginData.password = value;
                return null;
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _loginData = _loginData;
                        });
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Successfully Logged In ${_loginData.name}"),
                        ));
                      }
                    },
                    child: Text("Submit"),
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      _formKey.currentState.reset();
                      setState(() {
                        _loginData = _LoginData();
                      });
                    },
                    child: Text("Clear"),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: _loginData.name == null || _loginData.name.isEmpty
                ? Text("")
                : Text(
                    "Hello There ${_loginData.name} !!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.5,
                        color: Colors.blue),
                  ),
          )),
        ],
      ),
    );
  }
}
