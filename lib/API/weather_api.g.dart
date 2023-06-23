// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApi _$WeatherApiFromJson(Map<String, dynamic> json) => WeatherApi(
      weatherCondition: json['weather_condition'] as String?,
      maxTemperature: json['max_temperature'] as int?,
      minTemperature: json['min_temperature'] as int?,
    );

Map<String, dynamic> _$WeatherApiToJson(WeatherApi instance) =>
    <String, dynamic>{
      'weather_condition': instance.weatherCondition,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
    };
