import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:happyathome/models/Emotion.dart';
import 'package:happyathome/utils/EnumStringConverter.dart';

@jsonSerializable
class TargetFeeling {
  @JsonProperty(converter: EnumStringConverter(Emotion.values))
  final Emotion emotion;

  const TargetFeeling(this.emotion);
}