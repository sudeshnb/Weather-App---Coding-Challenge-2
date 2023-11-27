import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/src/features/weather/domain/usecases/weather.usecases.dart';

class SaveLocationState extends Equatable {
  final List<Weather> list;

  const SaveLocationState({this.list = const []});
  @override
  List<Object?> get props => [list];
}

class SaveLocationCubic extends Cubit<SaveLocationState> {
  SaveLocationCubic() : super(const SaveLocationState());

  Future<void> searchCity(String text) async {
    GetWeatherUseCase useCase = GetWeatherUseCase();
    final respons = await useCase.getCurrentWeatherByCityName(text);
    respons.fold(
      (weather) {
        state.list.where((element) {
          if (element.areaName == text) {
            emit(SaveLocationState(list: [...state.list]..remove(element)));
          }
          return false;
        }).toList();
        emit(SaveLocationState(list: [...state.list, weather.current]));
      },
      (fail) => null,
    );
  }

  Future<void> removeItem(Weather weather) async {
    emit(SaveLocationState(list: [...state.list]..remove(weather)));
  }
}
