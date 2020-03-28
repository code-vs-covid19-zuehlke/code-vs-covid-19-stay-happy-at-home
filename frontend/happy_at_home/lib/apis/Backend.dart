import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Backend {
  static const baseUrl = 'https://backend-sas4ozc6wa-ew.a.run.app/api/v1';

  static Future<User> ensureTestUser() async {
    final id = Uuid().v4();
    await postUser(User(id: id, name: "hans12"));
    return getUserById(id);
  }

  static Future<User> getUserById(String id) async {
    return _get('user/$id');
  }

  static Future<List<User>> getUsers() async {
    return _get('user');
  }

  static Future<String> postUser(User user) async {
    return _postRaw('user', user);
  }

  static Future<User> getPostById(String id) async {
    return _get('post/$id');
  }

  static Future<List<User>> getPosts() async {
    return _get('post');
  }

  static Future<String> postPost(Post post) async {
    return _postRaw('post', post);
  }

  // ------------------------------------------------------------------------------

  static Future<T> _get<T>(String path) async {
    final response = await _getRaw(path);
    return JsonMapper.deserialize<T>(json.decode(response));
  }

  static Future<T> _post<T>(String path, Object object) async {
    final response = await _postRaw(path, object);
    return JsonMapper.deserialize<T>(json.decode(response));
  }

  static Future<String> _getRaw(String path) async {
    final url = '$baseUrl/$path';
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return response.body;
    } else {
      throw Exception('Failed to load $url');
    }
  }

  static Future<String> _postRaw<T>(String path, Object object) async {
    final url = '$baseUrl/$path';

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JsonMapper.serialize(object));

    if (response.statusCode >= 200 && response.statusCode < 400) {
      return response.body;
    } else {
      throw Exception('Failed to load $url with status code ${response.statusCode}');
    }
  }
}
