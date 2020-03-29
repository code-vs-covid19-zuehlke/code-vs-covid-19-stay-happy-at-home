import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'ReactionSummary.dart';
import 'User.dart';

@jsonSerializable
class Reply {
  final int id;
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;
  final ReactionSummary reactionSummary;
  final User user;

  const Reply(this.id, this.title, this.description, this.link, this.picture,
      this.photoContentType, this.reactionSummary, this.user);
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
