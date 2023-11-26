import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  EitherData<WeatherModel> getCurrentWeatherByLocation(double lat, double lon);
  EitherData<WeatherModel> getCurrentWeatherByCityName(String city);
}
