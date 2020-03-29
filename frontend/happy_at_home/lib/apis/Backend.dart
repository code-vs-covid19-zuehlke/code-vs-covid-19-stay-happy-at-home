import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/models/Feeling.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reaction.dart';
import 'package:happyathome/models/Reply.dart';
import 'package:happyathome/models/User.dart';
import 'package:http/http.dart' as http;

class Backend {
  static const baseUrl = 'https://backend-sas4ozc6wa-ew.a.run.app/api/v1';

  static Future<User> getUserById(String id) async {
    return _get('user/$id');
  }

  static Future<List<User>> getUsers() async {
    return _get('user');
  }

  static Future<User> postUser(CreateUser user) async {
    return _post('user', user);
  }

  static Future<String> setFeelings(User user, List<Feeling> feelings) async {
    return _putRaw('user/${user.id}/feeling', feelings);
  }

  static Future<Post> getPostById(String id) async {
    return _get('post/$id');
  }

  static Future<List<Post>> getPosts() async {
    return _get('post');
  }

  static Future<Post> postPost(Post post) async {
    return _post('post', post);
  }

  static Future<Reply> postReply(Post post, Reply reply) async {
    return _post('post/${post.id}/reply', reply);
  }

  static Future<Reaction> postReactionToPost(Post post, Reaction reaction) async {
    return _post('post/${post.id}/reaction', reaction);
  }

  static Future<Reaction> postReactionToReply(Post post, Reply reply, Reaction reaction) async {
    return _post('post/${post.id}/reply/${reply.id}/reaction', reaction);
  }

  // ------------------------------------------------------------------------------

  static Future<T> _get<T>(String path) async {
    final response = await _getRaw(path);
    return JsonMapper.deserialize<T>(response);
  }

  static Future<T> _post<T>(String path, Object object) async {
    final response = await _postRaw(path, object);
    return JsonMapper.deserialize<T>(response);
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

  static Future<String> _putRaw<T>(String path, Object object) async {
    final url = '$baseUrl/$path';

    final response = await http.put(url,
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

  static void init(){
    JsonMapper().useAdapter(JsonMapperAdapter(
        valueDecorators: {
          typeOf<List<Feeling>>(): (value) => value.cast<Feeling>()
        })
    );
  }
}
