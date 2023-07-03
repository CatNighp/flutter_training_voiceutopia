import 'package:json_annotation/json_annotation.dart';

part 'weather_api.g.dart';

@JsonSerializable()
class WeatherApi {
  WeatherApi({this.weatherCondition, this.maxTemperature, this.minTemperature});

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiFromJson(json);

  @JsonKey(name: 'weather_condition')
  final String? weatherCondition;
  @JsonKey(name: 'max_temperature')
  final int? maxTemperature;
  @JsonKey(name: 'min_temperature')
  final int? minTemperature;

  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}
