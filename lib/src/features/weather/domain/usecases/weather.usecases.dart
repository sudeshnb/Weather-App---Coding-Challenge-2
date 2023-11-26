import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/data/implements/weather.repo.impl.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather.dart';

import '../repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository = WeatherRepositoryImpl();

  EitherData<WeatherModel> getCurrentWeatherByLocation(
      double lat, double lon) async {
    return repository.getCurrentWeatherByLocation(lat, lon);
  }

  EitherData<WeatherModel> getCurrentWeatherByCityName(String city) async {
    return repository.getCurrentWeatherByCityName(city);
  }
}
