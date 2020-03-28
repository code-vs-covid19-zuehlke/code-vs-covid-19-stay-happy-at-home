import 'dart:convert';

import 'package:happyathome/models/User.dart';
import 'package:http/http.dart' as http;

class Backend {
  static const baseUrl = 'https://backend-sas4ozc6wa-ew.a.run.app/api/v1';

  static Future<User> fetchUser() async {
    final response = await http.get('$baseUrl/user');
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
