import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'Reaction.dart';
import 'User.dart';

@jsonSerializable
class Reply {
  final int id;
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;
  final List<Reaction> replyReactions;
  final User user;

  const Reply(this.id, this.title, this.description, this.link, this.picture,
      this.photoContentType, this.replyReactions, this.user);
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
