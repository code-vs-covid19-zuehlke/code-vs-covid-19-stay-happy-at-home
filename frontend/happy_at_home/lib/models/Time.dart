import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Time {
  final int availableMinutes;
  final String time;

  const Time(this.availableMinutes, this.time);

  DateTime getDeadline() {
    return DateTime.parse(time).add(new Duration(minutes: availableMinutes));
  }
}

@jsonSerializable
class CreateTime {
  final int availableTime;

  const CreateTime(this.availableTime);
}
