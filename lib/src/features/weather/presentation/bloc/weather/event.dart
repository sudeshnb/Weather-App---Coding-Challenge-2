part of 'bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  final Position position;
  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];
}

class CityWeather extends WeatherBlocEvent {
  final String city;
  const CityWeather(this.city);
  @override
  List<Object> get props => [city];
}
