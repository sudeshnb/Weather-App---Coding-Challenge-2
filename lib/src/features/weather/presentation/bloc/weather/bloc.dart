import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather.dart';
import 'package:weather_app/src/features/weather/domain/usecases/weather.usecases.dart';

part 'event.dart';
part 'state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>(loading);
    on<CityWeather>(searchCity);
  }

  Future<void> loading(FetchWeather event, emit) async {
    GetWeatherUseCase useCase = GetWeatherUseCase();
    emit(WeatherBlocLoading());
    final respons = await useCase.getCurrentWeatherByLocation(
      event.position.latitude,
      event.position.longitude,
    );
    respons.fold(
      (weather) => emit(WeatherBlocSuccess(weather)),
      (fail) => emit(WeatherBlocFailure(fail)),
    );
  }

  Future<void> searchCity(CityWeather event, emit) async {
    GetWeatherUseCase useCase = GetWeatherUseCase();
    emit(WeatherBlocLoading());
    final respons = await useCase.getCurrentWeatherByCityName(event.city);
    respons.fold(
      (weather) => emit(WeatherBlocSuccess(weather)),
      (fail) => emit(WeatherBlocFailure(fail)),
    );
  }
}
