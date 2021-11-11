import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  String id;
  String name;

  Users({this.id, this.name});

  factory Users.createUsers(Map<String, dynamic> object) {
    return Users(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<List<Users>> getUser(String page) async {
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var apiGet = await http.get(apiURL);
    var jsonObject = json.decode(apiGet.body);

    List<dynamic> listUsers = (jsonObject as Map<String, dynamic>)['data'];

    List<Users> users = [];

    for (int i = 0; i < listUsers.length; i++) {
      users.add(Users.createUsers(listUsers[i]));
    }
    return users;
  }
}
