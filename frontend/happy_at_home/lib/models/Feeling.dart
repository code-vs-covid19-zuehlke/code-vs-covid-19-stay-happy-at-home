import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/apis/EnumStringConverter.dart';
import 'package:happyathome/models/Emoji.dart';

@jsonSerializable
class Feeling {
  @JsonProperty(converter: EnumStringConverter(Emoji.values))
  final Emoji emoji;

  Feeling({this.emoji});
}
