import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

import '../sources/weather.sources.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource = WeatherRemoteDataSource();

  @override
  EitherData<WeatherModel> getCurrentWeatherByLocation(
      double lat, double lon) async {
    return remoteDataSource.getCurrentWeatherByLocation(lat, lon);
  }

  @override
  EitherData<WeatherModel> getCurrentWeatherByCityName(String city) async {
    return remoteDataSource.getCurrentWeatherByCityName(city);
  }
}
