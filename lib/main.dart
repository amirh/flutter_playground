import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Playground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(body: new MyWidget()),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text('hello');
  }
}
