import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/data/models/models.dart';

abstract class SavedLocationRepository {
  EitherData<List<SaveLocation>> getSavedLocation();

  EitherData<bool> putSavedLocation(List<SaveLocation> list);
}
