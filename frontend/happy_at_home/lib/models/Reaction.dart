import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/utils/EnumStringConverter.dart';

import 'Emoji.dart';

@jsonSerializable
class Reaction {
  @JsonProperty(converter: EnumStringConverter(Emoji.values))
  final Emoji emoji;

  const Reaction(this.emoji);
}
