import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/src/core/animation/animation.dart';
import 'package:weather_app/src/core/constants/constants.dart';
import 'package:weather_app/src/core/utils/value.dart';

import '../bloc/weather/bloc.dart';

class WeatherPreviewCard extends StatelessWidget {
  const WeatherPreviewCard({super.key, required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: () => onPressed(context),
      child: Container(
        height: 153.0,
        padding: AppPadding.card,
        margin: AppPadding.cardMargin,
        decoration: AppDecoration.previewCard,
        child: _cardBody(),
      ),
    );
  }

  void onPressed(BuildContext context) {
    context.read<WeatherBlocBloc>().add(CityWeather(weather.areaName!));
    Navigator.pop(context);
  }

  Row _cardBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppValue.check(weather.areaName), style: AppTextStyle.style8),
            Text(AppValue.check(weather.weatherMain),
                style: AppTextStyle.style5),
            const Spacer(),
            _humidityValue(),
            AppSpace.h5,
            _windValue(),
          ],
        ),
        _temperatureValue(),
      ],
    );
  }

  Column _temperatureValue() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppValue.getWeatherIcon(weather)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppValue.celsius(weather), style: AppTextStyle.style13),
            Text('ºC', style: AppTextStyle.style8),
          ],
        ),
      ],
    );
  }

  RichText _windValue() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Wind', style: AppTextStyle.style6),
          TextSpan(
              text: AppValue.speed(weather), style: AppTextStyle.defaultStyle),
        ],
      ),
    );
  }

  RichText _humidityValue() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Humidity', style: AppTextStyle.style6),
          TextSpan(
              text: AppValue.humidity(weather),
              style: AppTextStyle.defaultStyle),
        ],
      ),
    );
  }
}
