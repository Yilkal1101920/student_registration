import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _form = GlobalKey<FormState>();
  String? StudentName;
  String? FatherName;
  String? ID;
  void writeData() async {
    _form.currentState?.save();
    var url = "https://studentregistration-e6acb-default-rtdb.firebaseio.com/" +
        "data.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "StudentName": StudentName,
          "FatherName": FatherName,
          "ID": ID,
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Student Registration System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:
              Text("High school and Preparatory Student Registration System "),
        ),
        body: Form(
          key: _form,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter your name"),
                  onSaved: (value) {
                    StudentName = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter father's name"),
                  onSaved: (value) {
                    FatherName = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter ID"),
                  onSaved: (value) {
                    ID = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    onPressed: writeData,
                    color: Colors.green,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
