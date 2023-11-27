import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/src/core/animation/animation.dart';
import 'package:weather_app/src/core/constants/constants.dart';
import 'package:weather_app/src/core/routes/routes.dart';
import 'package:weather_app/src/core/utils/value.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather.dart';
import 'package:weather_app/src/features/weather/presentation/cubit/image.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/background.dart';
import '../bloc/load/bloc.dart';
import '../bloc/weather/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          return PageBackground(
            children: [
              if (state is WeatherBlocSuccess) ...[
                ...homePageBody(state.weather)
              ] else if (state is WeatherBlocFailure)
                Align(
                  alignment: Alignment.center,
                  child: Text(state.msg, style: AppTextStyle.style4),
                )
              else
                Center(
                  child: CircularProgressIndicator(color: AppColor.white),
                )
            ],
          );
        },
      ),
    );
  }

  List<Widget> homePageBody(WeatherModel model) => [
        BackGroundImage(areaName: model.current.areaName!),
        _HomePageAppBar(weather: model.current),
        Align(
          alignment: const Alignment(0, -0.58),
          child: OpacityTranslateAnimation(
            duration: const Duration(milliseconds: 2000),
            child: Text(
              AppValue.mount(model.current),
              style: AppTextStyle.style11,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.45),
          child: OpacityTranslateAnimation(
            duration: const Duration(milliseconds: 2500),
            child: Text(
              'Updated as of ${AppValue.update(model.current)}',
              style: AppTextStyle.style4,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.3),
          child: TranslateUpAnimation(
            duration: const Duration(milliseconds: 1500),
            child: OpacityTranslateAnimation(
              duration: const Duration(milliseconds: 3500),
              child: SvgPicture.asset(
                AppValue.getWeatherIcon(model.current),
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.1),
          child: TranslateUpAnimation(
            duration: const Duration(milliseconds: 2000),
            child: OpacityTranslateAnimation(
              duration: const Duration(milliseconds: 3500),
              child:
                  Text(model.current.weatherMain!, style: AppTextStyle.style12),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.08),
          child: OpacityTranslateAnimation(
            duration: const Duration(milliseconds: 4500),
            child: TranslateUpAnimation(
              duration: const Duration(milliseconds: 2500),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppValue.celsius(model.current),
                    style: AppTextStyle.style14,
                  ),
                  Text('ºC', style: AppTextStyle.style9)
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.45),
          child: TranslateUpAnimation(
            duration: const Duration(milliseconds: 3000),
            child: Padding(
              padding: AppPadding.main,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _details(
                      title: 'HUMIDITY',
                      value: AppValue.humidity(model.current),
                      img: AppIcons.humidity),
                  _details(
                      title: 'WIND',
                      value: AppValue.speed(model.current),
                      img: AppIcons.wind),
                  _details(
                      title: 'FEELS LIKE',
                      value: '${AppValue.celsius(model.current)}°C',
                      img: AppIcons.feels),
                ],
              ),
            ),
          ),
        ),
        _NextWeekCard(forecast: model.forecast),
      ];

  Column _details(
      {required String title, required String value, required String img}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(img),
        Text(title, style: AppTextStyle.style2),
        Text(value, style: AppTextStyle.style2),
      ],
    );
  }
}

class _NextWeekCard extends StatelessWidget {
  const _NextWeekCard({required this.forecast});
  final List<Weather> forecast;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.9),
      child: TranslateUpAnimation(
        duration: const Duration(milliseconds: 3500),
        child: Container(
          height: 153.0,
          padding: const EdgeInsets.all(16.0),
          margin: AppPadding.main,
          decoration: BoxDecoration(
            color: AppColor.card.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: AppValue.getDates(forecast)
                .map((e) => _nextWeekDetails(e))
                .take(4)
                .toList(),
          ),
        ),
      ),
    );
  }

  Column _nextWeekDetails(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppValue.day(weather), style: AppTextStyle.style3),
        SvgPicture.asset(AppValue.getWeatherIcon(weather)),
        Text('${AppValue.celsius(weather)}°', style: AppTextStyle.defaultStyle),
        Text(AppValue.windSpeed(weather), style: AppTextStyle.style1),
      ],
    );
  }
}

class _HomePageAppBar extends StatelessWidget {
  const _HomePageAppBar({required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (builder, state) {
        return Align(
          alignment: const Alignment(0, -0.78),
          child: Padding(
            padding: AppPadding.main,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (state is MainSuccess)
                      ShrinkButton(
                        onPressed: () => context.read<WeatherBlocBloc>().add(
                              FetchWeather(state.position),
                            ),
                        child: Icon(Icons.pin_drop, color: AppColor.white),
                      )
                    else
                      Icon(Icons.pin_drop, color: AppColor.white),
                    AppSpace.w10,
                    Text(weather.areaName ?? '', style: AppTextStyle.style7),
                  ],
                ),
                ShrinkButton(
                  onPressed: () =>
                      Navigator.restorablePushNamed(context, RoutesName.search),
                  child: SvgPicture.asset(AppIcons.menu),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, required this.areaName});
  final String areaName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => ImageCubic()..findImage(areaName),
      child: BlocBuilder<ImageCubic, ImageState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state.imageUrl.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: state.imageUrl,
                  placeholder: (context, url) =>
                      const Shimmer(child: _ImageBox()),
                  errorWidget: (context, url, error) => const SizedBox(),
                  imageBuilder: (context, img) {
                    return _ImageBox(image: img);
                  },
                ),
              Container(
                color: AppColor.black.withOpacity(0.6),
              )
            ],
          );
        },
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({this.image});
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: AppDecoration.withImage(image),
    );
  }
}
