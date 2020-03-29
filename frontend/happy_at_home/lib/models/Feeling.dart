import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/utils/EnumStringConverter.dart';
import 'package:happyathome/models/Emoji.dart';

@jsonSerializable
class Feeling {
  @JsonProperty(converter: EnumStringConverter(Emoji.values))
  final Emoji emoji;

  const Feeling(this.emoji);
}
