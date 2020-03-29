import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Reply {
  final int id;
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;

  const Reply(this.id, this.title, this.description, this.link, this.picture,
      this.photoContentType);
}

@jsonSerializable
class CreateReply {
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;

  const CreateReply(this.title, this.description, this.link, this.picture,
      this.photoContentType);
}
