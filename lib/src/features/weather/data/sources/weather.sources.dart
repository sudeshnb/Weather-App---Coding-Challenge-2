import 'package:dartz/dartz.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/src/core/api/api.dart';
import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather.dart';

class WeatherRemoteDataSource {
  // Make API call to fetch data and return object.
  WeatherFactory w = WeatherFactory(AppAPI.weather);
  //
  EitherData<WeatherModel> getCurrentWeatherByLocation(
      double lat, double lon) async {
    try {
      if (await NetworkInfo.isConnected) {
        Weather weather = await w.currentWeatherByLocation(lat, lon);
        List<Weather> forecast = await w.fiveDayForecastByLocation(lat, lon);
        return Left(WeatherModel(current: weather, forecast: forecast));
      }
      return const Right('Connection lost');
    } catch (e) {
      return const Right('Failed to load weather data.');
    }
  }

  EitherData<WeatherModel> getCurrentWeatherByCityName(String city) async {
    try {
      if (await NetworkInfo.isConnected) {
        Weather weather = await w.currentWeatherByCityName(city);
        List<Weather> forecast = await w.fiveDayForecastByCityName(city);
        return Left(WeatherModel(current: weather, forecast: forecast));
      }
      return const Right('Connection lost');
    } catch (e) {
      return const Right('Failed to load weather data.');
    }
  }
}
