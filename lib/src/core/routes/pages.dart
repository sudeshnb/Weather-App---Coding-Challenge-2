library route_pages;

import 'package:flutter/material.dart';
import 'package:weather_app/src/features/weather/presentation/pages/home.dart';
import 'package:weather_app/src/features/weather/presentation/pages/main.dart';
import 'package:weather_app/src/features/weather/presentation/pages/search.dart';
import '/src/core/error/error.dart';
import '/src/core/animation/animation.dart';
import 'routes.dart';

class AppRoute {
  static const initial = RoutesName.initial;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
        return const PageFadeTransition(child: MainPage()).build;
      case RoutesName.home:
        return const PageFadeTransition(child: HomePage()).build;
      case RoutesName.search:
        return const PageFadeTransition(child: SearchPage()).build;
      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
