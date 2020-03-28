import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:uuid/uuid.dart';

@jsonSerializable
class User {
  final String id;
  final String name;

  User({this.id, this.name});

  static User createUser(String name) {
    final id = Uuid().v4();
    return User(id: id, name: name);
  }
}
