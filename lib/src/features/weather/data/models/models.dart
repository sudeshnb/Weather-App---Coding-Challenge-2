// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather/weather.dart';

class SaveLocation {
  final String id;
  final String areaName;
  final double humidity;
  final double wind;
  final String weatherMain;
  final int code;
  final double temp;

  SaveLocation({
    required this.id,
    required this.areaName,
    required this.humidity,
    required this.wind,
    required this.weatherMain,
    required this.code,
    required this.temp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'areaName': areaName,
      'humidity': humidity,
      'wind': wind,
      'weatherMain': weatherMain,
      'code': code,
      'temp': temp,
    };
  }

  factory SaveLocation.fromMap(Map<String, dynamic> map) {
    return SaveLocation(
      id: map['id'] as String,
      areaName: map['areaName'] as String,
      humidity: map['humidity'] as double,
      wind: map['wind'] as double,
      weatherMain: map['weatherMain'] as String,
      code: map['code'] as int,
      temp: map['temp'] as double,
    );
  }
  factory SaveLocation.fromWeather(Weather map) {
    return SaveLocation(
      id: map.hashCode.toString(),
      areaName: map.areaName as String,
      humidity: map.humidity as double,
      wind: map.windSpeed as double,
      weatherMain: map.weatherMain as String,
      code: map.weatherConditionCode as int,
      temp: map.temperature!.celsius!,
    );
  }
  String toJson() => json.encode(toMap());

  factory SaveLocation.fromJson(String source) =>
      SaveLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
