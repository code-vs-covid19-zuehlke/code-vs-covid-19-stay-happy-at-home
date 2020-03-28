import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class User {
  final String id;
  final String name;

  User({this.id, this.name});
}
