import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/data/sources/demo.dart';
import 'package:weather_app/src/features/weather/domain/entities/areas.dart';

class SearchState extends Equatable {
  final List<AreaEntity> list;

  const SearchState({this.list = const []});
  @override
  List<Object?> get props => [list];
}

class SearchCubic extends Cubit<SearchState> {
  SearchCubic() : super(SearchState(list: AreaModel.areas));

  void onSearch(String? text) {
    try {
      final areas = AreaModel.areas
          .where((element) =>
              element.cityName.toLowerCase().contains(text!.toLowerCase()))
          .map((e) => e)
          .toList();
      emit(SearchState(list: areas));
    } catch (_) {}
  }
}
