import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'app.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection
  await ServicesInjection.init();
  //  This is the main app
  runApp(const WeatherApp());
}
