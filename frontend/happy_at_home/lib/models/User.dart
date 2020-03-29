import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:uuid/uuid.dart';

import 'Feeling.dart';
import 'Time.dart';

@jsonSerializable
class User {
  final String id;
  final String name;
  final String photo;
  final String photoContentType;
  final List<Feeling> feelings;
  final Time timeRecord;

  const User(this.id, this.name, this.photo,this.photoContentType, this.feelings, this.timeRecord);
}

@jsonSerializable
class CreateUser {
  final String id;
  final String name;
  final String photo;
  final String photoContentType;

  const CreateUser(this.id, this.name, this.photo, this.photoContentType);

  static CreateUser createUser(String name, String photoAsBase64, String contentType) {
    final id = Uuid().v4();
    return CreateUser(id, name, photoAsBase64, contentType);
  }
}
