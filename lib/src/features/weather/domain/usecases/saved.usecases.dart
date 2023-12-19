import 'package:weather_app/src/core/error/error.dart';
import 'package:weather_app/src/features/weather/data/implements/saved.repo.impl.dart';
import 'package:weather_app/src/features/weather/data/models/models.dart';
import 'package:weather_app/src/features/weather/domain/repositories/saved.repository.dart';

class GetSavedLocationUseCase {
  final SavedLocationRepository repository = SavedLocationRepositoryImpl();

  EitherData<List<SaveLocation>> getLocations() async {
    return repository.getSavedLocation();
  }

  EitherData<bool> putLocations(List<SaveLocation> list) async {
    return repository.putSavedLocation(list);
  }
}
