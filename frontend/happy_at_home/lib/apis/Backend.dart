import 'dart:convert';

import 'package:happyathome/models/User.dart';
import 'package:http/http.dart' as http;

class Backend {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<User> fetchUser(int id) async {
    final response = await http.get('$baseUrl/users/$id');
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
