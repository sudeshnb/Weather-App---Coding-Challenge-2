import 'package:flutter/material.dart';
import 'package:weather_app/src/core/service/storage.dart';

class ServicesInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await StorageService().init();
  }
}
