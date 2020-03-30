import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'Emoji.dart';

@jsonSerializable
class ReactionSummary {
  @JsonProperty(enumValues: Emoji.values)
  final Map<Emoji, int> reactions;

  const ReactionSummary(this.reactions);
}
