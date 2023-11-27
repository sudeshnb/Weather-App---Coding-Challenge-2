import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
part 'event.dart';
part 'state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<DeterminePosition>(checkPermission);
  }

  Future<void> checkPermission(DeterminePosition event, emit) async {
    bool serviceEnabled;
    LocationPermission permission;
    emit(MainLoading());
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const MainFailure('Location services are disabled.'));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(const MainFailure('Location permissions are denied'));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      openAppSettings();
      emit(
        const MainFailure(
            'Location permissions are permanently denied, we cannot request permissions.'),
      );
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    emit(MainSuccess(position: position));
    return;
  }
}
