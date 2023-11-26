import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/data/implements/image.repo.impl.dart';
import 'package:weather_app/src/features/weather/domain/repositories/image_repository.dart';

class GetImageUseCase {
  final ImageRepository repository = ImageRepositoryImpl();

  EitherData<String> getCityImage(String city) async {
    return repository.getImageUrlForCity(city);
  }
}
