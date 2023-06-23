import 'package:json_annotation/json_annotation.dart';

part 'weather_api.g.dart';

@JsonSerializable()
class WeatherApi {
  WeatherApi({this.weather_condition, this.max_temperature, this.min_temperature});

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiFromJson(json);

  final String? weather_condition;
  final int? max_temperature;
  final int? min_temperature;

  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}
