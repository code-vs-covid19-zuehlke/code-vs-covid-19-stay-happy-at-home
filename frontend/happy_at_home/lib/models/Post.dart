import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/models/TargetFeeling.dart';

import 'Reaction.dart';
import 'Reply.dart';

@jsonSerializable
class Post {
  final int id;
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;
  final List<Reaction> postReactions;
  final List<Reply> replies;

  const Post(this.id, this.title, this.description, this.link, this.picture,
      this.photoContentType, this.postReactions, this.replies);
}

@jsonSerializable
class CreatePost {
  final String title;
  final String description;
  final String link;
  final String picture;
  final String photoContentType;
  final Set<TargetFeeling> targetFeelings;

  const CreatePost(this.title, this.description, this.link, this.picture,
      this.photoContentType, this.targetFeelings);
}
