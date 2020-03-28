import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:uuid/uuid.dart';

import 'Feeling.dart';

@jsonSerializable
class User {
  final String id;
  final String name;
  final List<Feeling> feelings;

  User({this.id, this.name, this.feelings});

  static User createUser(String name) {
    final id = Uuid().v4();
    return User(id: id, name: name, feelings: []);
  }
}
