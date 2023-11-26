import 'package:weather_app/src/core/error/error.dart';

abstract class ImageRepository {
  EitherData<String> getImageUrlForCity(String city);
}
