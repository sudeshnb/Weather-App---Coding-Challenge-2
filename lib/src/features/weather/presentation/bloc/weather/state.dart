part of 'bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {
  final String msg;
  const WeatherBlocFailure(this.msg);
  @override
  List<Object> get props => [msg];
}

final class WeatherBlocSuccess extends WeatherBlocState {
  final WeatherModel weather;

  const WeatherBlocSuccess(this.weather);
  @override
  List<Object> get props => [weather];
}
