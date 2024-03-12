import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyDatabase extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyDatabase> {
  final _form = GlobalKey<FormState>();
  String? title;
  void writeData() async {
    _form.currentState?.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "DatabaseURL" + "data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Form(
          key: _form,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter Title"),
                  onSaved: (value) {
                    title = value;
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
