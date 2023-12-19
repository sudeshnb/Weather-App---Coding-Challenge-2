import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/data/models/models.dart';
import 'package:weather_app/src/features/weather/domain/usecases/saved.usecases.dart';
import 'package:weather_app/src/features/weather/domain/usecases/weather.usecases.dart';

class SaveLocationState extends Equatable {
  final List<SaveLocation> list;

  const SaveLocationState({this.list = const []});
  @override
  List<Object?> get props => [list];
}

class SaveLocationCubic extends Cubit<SaveLocationState> {
  SaveLocationCubic() : super(SaveLocationState(list: saveList));

  static List<SaveLocation> saveList = [];
  GetSavedLocationUseCase location = GetSavedLocationUseCase();
  void init() async {
    final response = await location.getLocations();
    response.fold(
      (value) => saveList.addAll(value),
      (r) => null,
    );
  }

  // static List<SaveLocation> saveList = SaveLocation.fromJson(source);

  Future<void> searchCity(String text) async {
    GetWeatherUseCase useCase = GetWeatherUseCase();
    final respons = await useCase.getCurrentWeatherByCityName(text);
    respons.fold(
      (weather) {
        state.list.where((element) {
          if (element.areaName == text) {
            emit(SaveLocationState(list: [...state.list]..remove(element)));
            // CacheLocation.saveLocation(state.list);
            location.putLocations(state.list);
          }
          return false;
        }).toList();
        // emit(SaveLocationState(list: [...state.list, weather.current]));

        emit(SaveLocationState(
            list: [...state.list, SaveLocation.fromWeather(weather.current)]));
        location.putLocations(state.list);

        // CacheLocation.saveLocation(state.list);
      },
      (fail) => null,
    );
  }

  Future<void> removeItem(SaveLocation weather) async {
    emit(SaveLocationState(list: [...state.list]..remove(weather)));
    // CacheLocation.saveLocation(state.list);
    location.putLocations(state.list);
  }
}
