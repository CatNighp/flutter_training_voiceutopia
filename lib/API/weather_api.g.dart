// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApi _$WeatherApiFromJson(Map<String, dynamic> json) => WeatherApi(
      weather_condition: json['weather_condition'] as String?,
      max_temperature: json['max_temperature'] as int?,
      min_temperature: json['min_temperature'] as int?,
    );

Map<String, dynamic> _$WeatherApiToJson(WeatherApi instance) =>
    <String, dynamic>{
      'weather_condition': instance.weather_condition,
      'max_temperature': instance.max_temperature,
      'min_temperature': instance.min_temperature,
    };
