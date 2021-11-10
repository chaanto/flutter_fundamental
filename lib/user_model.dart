import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String id;
  String firstName;
  String lastName;
  String email;

  User({this.id, this.firstName, this.lastName, this.email});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      firstName: object['first_name'],
      lastName: object['last_name'],
      email: object['email'],
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;

    var apiGet = await http.get(apiURL);
    var jsonObject = json.decode(apiGet.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
