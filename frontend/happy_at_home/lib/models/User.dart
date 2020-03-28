import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:uuid/uuid.dart';

import 'Feeling.dart';

@jsonSerializable
class User {
  final String id;
  final String name;
  final String photo;
  final List<Feeling> feelingRecords;

  User({this.id, this.name, this.photo, this.feelingRecords});

  static User createUser(String name) {
    final id = Uuid().v4();
    return User(id: id, name: name, photo: null, feelingRecords: []);
  }
}
