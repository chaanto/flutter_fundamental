import 'package:flutter/material.dart';
import 'package:flutter_fundamental/post_method.dart';
import 'package:flutter_fundamental/user_model.dart';
import 'package:flutter_fundamental/users_model.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult;
  User user;
  String output = "No Data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Api demo"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null)
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.created
                  : "No Data"),
              TextButton(
                onPressed: () {
                  PostResult.connectToAPI('Yugi', 'Software Engineer')
                      .then((result) {
                    postResult = result;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              ),
              Text((user != null)
                  ? user.id +
                      " | " +
                      user.firstName +
                      " | " +
                      user.lastName +
                      " | " +
                      user.email
                  : "No Data"),
              TextButton(
                onPressed: () {
                  User.connectToAPI("3").then((result) {
                    user = result;
                    setState(() {});
                  });
                },
                child: Text("Get"),
              ),
              Text(output),
              TextButton(
                onPressed: () {
                  Users.getUser("2").then((result) {
                    output = "";
                    for (int i = 0; i < result.length; i++) {
                      output = output + "{ " + result[i].name + " }";
                      setState(() {});
                    }
                  });
                },
                child: Text("Gets"),
              )
            ]),
      ),
    ));
  }
}
