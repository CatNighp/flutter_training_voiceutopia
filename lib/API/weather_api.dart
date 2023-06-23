import 'package:json_annotation/json_annotation.dart';

part 'weather_api.g.dart';

@JsonSerializable()
class WeatherApi {
  WeatherApi({this.weatherCondition, this.maxTemperature, this.minTemperature});

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiFromJson(json);

  final String? weatherCondition;
  final int? maxTemperature;
  final int? minTemperature;

  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}
