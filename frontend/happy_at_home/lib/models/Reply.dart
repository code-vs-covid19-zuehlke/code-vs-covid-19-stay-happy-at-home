import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'Reaction.dart';

@jsonSerializable
class Reply {
  final int id;
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;
  final List<Reaction> replyReactions;

  const Reply(this.id, this.title, this.description, this.link, this.picture,
      this.photoContentType, this.replyReactions);
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
