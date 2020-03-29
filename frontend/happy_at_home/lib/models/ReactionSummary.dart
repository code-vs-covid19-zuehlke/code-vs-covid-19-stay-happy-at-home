import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ReactionSummary {
  final Map<String, dynamic> reactions;

  ReactionSummary(this.reactions);
}
