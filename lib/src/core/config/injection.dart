import 'package:flutter/material.dart';

class ServicesInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
