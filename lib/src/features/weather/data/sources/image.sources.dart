import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/error/error.dart';

class ImageRemoteDataSource {
  EitherData<String> getImageUrlForCity(String city) async {
    // Use Unsplash API or any other image API to get a city image based on the city name.
    // For simplicity, I'm using a placeholder image URL.
    try {
      if (await NetworkInfo.isConnected) {
        return Left('https://via.placeholder.com/500?text=$city');
      }
      return const Right('Connection lost');
    } catch (e) {
      return const Right('Failed to image data.');
    }
  }
}
