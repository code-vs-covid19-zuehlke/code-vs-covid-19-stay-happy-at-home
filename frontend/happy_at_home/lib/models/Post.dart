import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Post {
  final String id;

  const Post(this.id);
}
