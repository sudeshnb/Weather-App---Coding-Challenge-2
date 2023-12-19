import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/data/models/models.dart';
import 'package:weather_app/src/features/weather/data/sources/saved.sources.dart';
import 'package:weather_app/src/features/weather/domain/repositories/saved.repository.dart';

class SavedLocationRepositoryImpl implements SavedLocationRepository {
  final SavedLocationLocalSource remoteDataSource = SavedLocationLocalSource();

  @override
  EitherData<List<SaveLocation>> getSavedLocation() async {
    return remoteDataSource.getSavedLocation();
  }

  @override
  EitherData<bool> putSavedLocation(List<SaveLocation> list) async {
    return remoteDataSource.putSavedLocation(list);
  }
}
