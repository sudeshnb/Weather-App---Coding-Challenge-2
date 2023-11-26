import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/domain/repositories/image_repository.dart';

import '../sources/image.sources.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource = ImageRemoteDataSource();

  @override
  EitherData<String> getImageUrlForCity(String city) async {
    return remoteDataSource.getImageUrlForCity(city);
  }
}
