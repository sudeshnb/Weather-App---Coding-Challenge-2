import 'package:weather/weather.dart';

class WeatherModel {
  final Weather current;
  final List<Weather> forecast;

  WeatherModel({required this.current, required this.forecast});
}
