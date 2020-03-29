import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:enum_to_string/enum_to_string.dart';

class EnumStringConverter<T> implements ICustomConverter<T> {
  final List<dynamic> enumValues;

  const EnumStringConverter(this.enumValues) : super();

  @override
  T fromJSON(jsonValue, [JsonProperty jsonProperty]) {
    return EnumToString.fromString(enumValues, jsonValue);
  }

  @override
  String toJSON(T object, [JsonProperty jsonProperty]) {
    return EnumToString.parse(object);
  }
}