import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/core/animation/animation.dart';
import 'package:weather_app/src/core/constants/constants.dart';
import 'package:weather_app/src/core/widgets/scroll/scroll.detect.dart';
import 'package:weather_app/src/features/weather/presentation/cubit/save.location.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: PageBackground(
        children: [
          Positioned(
            top: 78.0,
            left: 24.0,
            right: 24.0,
            bottom: 0,
            child: Column(
              children: [_SearchPageAppBar(), _SearchPageBody()],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchPageBody extends StatelessWidget {
  const _SearchPageBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveLocationCubic, SaveLocationState>(
        builder: (context, state) {
      return Expanded(
        child: ScrollDetective(
          list: ListView(
            padding: EdgeInsets.zero,
            children: [
              // ...state.list.map((e) => WeatherPreviewCard(weather: e)),
              ...List.generate(
                state.list.length,
                (index) => TranslateLeftAnimation(
                  duration:
                      Duration(milliseconds: index == 0 ? 400 : 600 * index),
                  child: WeatherPreviewCard(weather: state.list[index]),
                ),
              ),
              if (state.list.length < 4) const LocationAddButton(),
              // const SizedBox(),
            ],
          ),
          top: Container(decoration: AppDecoration.scroll, height: 50.h),
        ),
      );
    });
  }
}

class _SearchPageAppBar extends StatelessWidget {
  const _SearchPageAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _backButton(context),
            AppSpace.w10,
            Text('Saved Locations', style: AppTextStyle.style7),
          ],
        ),
        _searchButton(),
      ],
    );
  }

  ShrinkButton _searchButton() {
    return ShrinkButton(
      onPressed: () {},
      child: SvgPicture.asset(AppIcons.search),
    );
  }

  ShrinkButton _backButton(BuildContext context) {
    return ShrinkButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: AppColor.white,
      ),
    );
  }
}
