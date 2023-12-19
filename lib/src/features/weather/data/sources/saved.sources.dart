import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/core/service/storage.dart';

import '../models/models.dart';

class SavedLocationLocalSource {
  EitherData<List<SaveLocation>> getSavedLocation() async {
    try {
      String source = StorageService.savedList;
      // List<SaveLocation> saveList = SaveLocation.fromJson(source);
      return const Left([]);
    } catch (e) {
      return const Right('Failed to load weather data.');
    }
  }

  EitherData<bool> putSavedLocation(List<SaveLocation> list) async {
    try {
      // StorageService.setString(value);
      // List<SaveLocation> saveList = SaveLocation.fromJson(source);
      return const Left(true);
    } catch (e) {
      return const Right('Failed to load weather data.');
    }
  }
}
