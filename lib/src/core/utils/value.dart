import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/src/core/constants/constants.dart';

class AppValue {
  static List<Weather> getDates(List<Weather> weather) {
    List<Weather> newList = [];
    List.generate(
      weather.length,
      (index) {
        if (index > 0 && index % 7 == 0) {
          newList.add(weather[index]);
        }
      },
      growable: false,
    ).toList();
    return newList;
  }

  static String getWeatherIcon(Weather code) {
    if (code.weatherConditionCode == null) return AppIcons.image1;
    switch (code.weatherConditionCode!) {
      case >= 200 && < 300:
        return AppIcons.image3;
      case >= 300 && < 400:
        return AppIcons.image3;
      case >= 500 && < 600:
        return AppIcons.image2;
      case >= 600 && < 700:
        return AppIcons.image2;
      case >= 700 && < 800:
        return AppIcons.image2;
      case == 800:
        return AppIcons.image1;
      case > 800 && <= 804:
        return AppIcons.image1;
      default:
        return AppIcons.image1;
    }
  }

  static String check(String? value) {
    return value ?? '';
  }

  static String celsius(Weather value) {
    if (value.temperature != null) {
      if (value.temperature!.celsius == null) return '';
      return '${value.temperature!.celsius!.round()}';
    }
    return '';
  }

  static String speed(Weather value) {
    if (value.windSpeed == null) return '';
    return ' ${value.windSpeed!.toStringAsFixed(1)}km/h';
  }

  static String humidity(Weather value) {
    if (value.humidity == null) return '';
    return ' ${value.humidity!.round()}%';
  }

  static String mount(Weather value) {
    if (value.date == null) return '';
    return DateFormat('MMMM dd').format(value.date!);
  }

  static String update(Weather value) {
    if (value.date == null) return '';
    return '${DateFormat().add_jm().format(value.date!)} ${value.date!.timeZoneName}';
  }

  static String day(Weather value) {
    if (value.date == null) return '';
    return DateFormat('EEE dd').format(value.date!);
  }

  static String windSpeed(Weather value) {
    if (value.windGust == null) return '';
    if (value.windSpeed == null) return '';

    return '${value.windGust!.round()}-${value.windSpeed!.round()}\nkm/h';
  }
}
