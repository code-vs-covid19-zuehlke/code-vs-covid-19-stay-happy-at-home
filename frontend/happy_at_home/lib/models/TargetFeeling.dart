import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: TargetFeeling.values)
enum TargetFeeling {
  HAPPY,
  RELAXED,
  ACCOMPLISHED,
  INFORMED,
  ENERGIZED,
  AWWW,
  INSPIRED,
}
