import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Time {
  final int availableTime;

  const Time(this.availableTime);
}
