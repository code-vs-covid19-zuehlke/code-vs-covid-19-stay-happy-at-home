import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: Emotion.values)
enum Emotion {
  HAPPY,
  RELAXED,
  ACCOMPLISHED,
  INFORMED,
  ENERGIZED,
  AWWW,
  INSPIRED,
  ENTERTAINED
}
