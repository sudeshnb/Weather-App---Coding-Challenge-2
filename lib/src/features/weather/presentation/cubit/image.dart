import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/data/models/models.dart';

class ImageState extends Equatable {
  final String imageUrl;

  const ImageState({this.imageUrl = ''});
  @override
  List<Object?> get props => [imageUrl];
}

class ImageCubic extends Cubit<ImageState> {
  ImageCubic() : super(const ImageState());

  void findImage(String text) {
    try {
      final String imageUrl = AreaModel.areas
          .where((element) => element.cityName.contains(text))
          .map((e) => e.imageUrl)
          .first;

      emit(ImageState(imageUrl: imageUrl));
    } catch (_) {}
  }
}
