import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello gan'),
        ),
        body: Container(
          child: Center(
            child: Text('Hello Browww wjhahahaha')
          ),
        ),
      ),
    );
  }
}